package br.com.farmaweb.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/")
public class MainServlet extends HttpServlet{
	
	protected void service(HttpServletRequest req, HttpServletResponse res)
              throws ServletException, IOException {
		
		res.sendRedirect("views/login.jsp");
    }

}
