package com.pharma.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pharma.business.MedicineBo;

@WebServlet("/PageServ")
public class PageServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		HttpSession sess = request.getSession();
		sess.setAttribute("page", name);
		var medbo = new MedicineBo();
		var li = medbo.getAllMed();
		var mcli = medbo.getAllMedCode();
		sess.setAttribute("mli", li);
		var tli = new ArrayList<String>(Arrays.asList("Syrup", "Tablet", "Capsule"));
		sess.setAttribute("tyli", tli);
		sess.setAttribute("mcli", mcli);
		try {
			response.sendRedirect("home.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
