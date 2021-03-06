package br.com.farmaweb.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.farmaweb.daos.FarmaciaDao;
import br.com.farmaweb.models.Farmacia;

@WebServlet("/listarFarmacia")
public class ListarFarmacia extends HttpServlet {

	private static final long serialVersionUID = 5205179580315633881L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		try {
			FarmaciaDao farmaciaDao = new FarmaciaDao();
			List<Farmacia> farmacias = farmaciaDao.getFarmacias();
			req.setAttribute("farmacias", farmacias);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}	
		
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/listarFarmacia.jsp");
		rd.forward(req, res);

	}

}
