package com.pharma.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pharma.business.MedicineBo;
import com.pharma.exception.NotFoundException;

@WebServlet("/DeleteServ")
public class DeleteServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String bCode = request.getParameter("bcode");

		MedicineBo mbo = new MedicineBo();

		try {
			if (!mbo.delMed(bCode)) {
				throw new NotFoundException("Batch Code: " + bCode + " not exist");
			} else {
				session.setAttribute("smg", "Batch Code: " + bCode + " deleted Successfully");
			}
		} catch (NotFoundException e) {
			session.setAttribute("fmg", e.getMessage());
		}
		try {
			response.sendRedirect("home.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
