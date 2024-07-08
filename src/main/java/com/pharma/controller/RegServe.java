package com.pharma.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pharma.bean.Medicine;
import com.pharma.business.MedicineBo;
import com.pharma.exception.DuplicateException;


@WebServlet("/RegServe")
public class RegServe extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String bcode = request.getParameter("bcode");
		String mcode = request.getParameter("mcode");
		String weight = request.getParameter("weight");
		String price = request.getParameter("price");
		String mtype = request.getParameter("mtype");
		String refri = request.getParameter("Refri");

		var med = new Medicine(bcode,mcode,weight,price,mtype,refri);
		var mbo= new MedicineBo();
		try {
			mbo.addMedBatch(med);
			session.setAttribute("smg", "BatchCode " + bcode + " registered sucessfully");
		} catch (DuplicateException e) {
			session.setAttribute("fmg", e.getMessage());
			e.printStackTrace();
		}
		try {
		response.sendRedirect("home.jsp");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
