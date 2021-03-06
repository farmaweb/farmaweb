package br.com.farmaweb.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import br.com.farmaweb.daos.PedidoDao;
import br.com.farmaweb.daos.ProdutoDao;
import br.com.farmaweb.models.Pedido;

@WebServlet("/incluirPedido")
@MultipartConfig(maxFileSize = 5242880,maxRequestSize=5242880)
public class IncluirPedido extends HttpServlet {

	private static final long serialVersionUID = -4360001337042041844L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String status = "Aberto";
		String valor_total = req.getParameter("valorTotal");
		String valor_desconto = req.getParameter("descontoTotal");
		Integer cod_endereco = Integer.parseInt(req.getParameter("cod_endereco"));
		Integer cod_farmacia = Integer.parseInt(req.getParameter("cod_farmacia"));
		
		LocalDateTime data_pedido = LocalDateTime.now();

		int cod_pag_ped = Integer.parseInt(req.getParameter("cod_pagamento"));
		int cod_cli_ped = Integer.parseInt(req.getParameter("cod_cliente"));

		String[] cod_produtos = req.getParameterValues("id_produto");
		String[] quantidade_produtos = req.getParameterValues("quantidade_produto");
		
		InputStream inputStream = null; 

        Part filePart = req.getPart("foto_receita");
        if (filePart != null) {
        	inputStream = filePart.getInputStream();
        }

		Pedido pedido = new Pedido();
		pedido.setStatus(status);
		pedido.setValor_total(Double.parseDouble(valor_total));
		pedido.setValor_desconto(Double.parseDouble(valor_desconto));
		pedido.setData_pedido(data_pedido.toString());
		pedido.setFoto_receita(inputStream);
		pedido.setCod_pag_ped(cod_pag_ped);
		pedido.setCod_cli_ped(cod_cli_ped);
		pedido.setCod_endereco(cod_endereco);
		pedido.setCod_farmacia(cod_farmacia);
		

		try {
			PedidoDao pedidoDao = new PedidoDao();
			ProdutoDao produtoDao = new ProdutoDao();
			
			int cod_pedido = pedidoDao.incluirPedido(pedido);
			
			for(int a = 0; a < cod_produtos.length; a++) {
				int quantidade_estoque = produtoDao.getQuantidadeProduto(Integer.parseInt(cod_produtos[a]));
			
				int quantidade_nova = quantidade_estoque - Integer.parseInt(quantidade_produtos[a]);
				produtoDao.alterarQuantidade(Integer.parseInt(cod_produtos[a]), quantidade_nova);
				pedidoDao.incluirPedProd(cod_pedido, Integer.parseInt(cod_produtos[a]),  Integer.parseInt(quantidade_produtos[a]));
				
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		RequestDispatcher rd = req.getRequestDispatcher("/listaPedido");
		rd.forward(req, res);
	}

}
