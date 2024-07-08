package com.pharma.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pharma.bean.Medicine;
import com.pharma.business.MedicineBo;
import com.pharma.exception.NotFoundException;

/**
 * Servlet implementation class UpdateServ
 */
@WebServlet("/UpdateServ")
public class UpdateServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String bcode = request.getParameter("bCode");
		String mcode = request.getParameter("mcode");
		String weight = request.getParameter("weight");
		String price = request.getParameter("price");
		String mtype = request.getParameter("mtype");
		String refri = request.getParameter("Refri");
		var med = new Medicine(bcode,mcode,weight,price,mtype,refri);
		var mbo= new MedicineBo();
		try {
			mbo.updateMed(med);
		} catch (NotFoundException e) {
			e.printStackTrace();
		}try {
		response.sendRedirect("PageServ?name=showb");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
