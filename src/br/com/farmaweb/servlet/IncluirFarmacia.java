package br.com.farmaweb.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.farmaweb.daos.FarmaciaDao;
import br.com.farmaweb.models.Farmacia;


@WebServlet("/incluirFarmacia")
public class IncluirFarmacia extends HttpServlet {

	private static final long serialVersionUID = 2493436086519680293L;

	@Override
    protected void service(HttpServletRequest req, HttpServletResponse res)
              throws ServletException, IOException {
		
		String nome_fantasia = req.getParameter("nome_fantasia");
		String razao_social = req.getParameter("razao_social");
		Integer cnpj_farm = Integer.parseInt(req.getParameter("cnpj_farm"));
		Integer tel_farm = Integer.parseInt(req.getParameter("tel_farm"));
		String observacao = req.getParameter("observacao");
		
		Farmacia farmacia = new Farmacia();
		
		farmacia.setNome_fantasia(nome_fantasia);
		farmacia.setRazao_social(razao_social);
		farmacia.setCnpj_farm(cnpj_farm);
		farmacia.setTel_farm(tel_farm);
		farmacia.setObservacao(observacao);
		
		FarmaciaDao farmaciaDao = null;
		
		try {
			farmaciaDao = new FarmaciaDao();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			farmaciaDao.incluirFarmacia(farmacia);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		res.sendRedirect("views/sucesso.jsp");
	    		
	}
}
