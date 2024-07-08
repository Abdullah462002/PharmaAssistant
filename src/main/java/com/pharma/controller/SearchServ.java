package com.pharma.controller;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pharma.bean.Medicine;
import com.pharma.business.MedicineBo;
import com.pharma.exception.NotFoundException;

@WebServlet("/SearchServ")
public class SearchServ extends HttpServlet implements Serializable {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String bCode = request.getParameter("bcode");

		MedicineBo mbo = new MedicineBo();
		List<Medicine> mli = null;
		try {
			mli = mbo.getMed(bCode);
			if (!mli.isEmpty()) {
				session.setAttribute("smg", mli);
				String lvl = null;
				int shipcost = 2500;
				for (Medicine med : mli) {
					if (med.medicineType().equalsIgnoreCase("tablet")) {
						lvl = "High";
					} else if (med.medicineType().equalsIgnoreCase("syrup")) {
						lvl = "Normal";
					} else {
						lvl = "Extra High";
					}
					if (med.refrigeration().equalsIgnoreCase("yes")) {
						shipcost += shipcost * 0.05;
					}
				}
				session.setAttribute("lvl", lvl);
				session.setAttribute("sc", shipcost);
			} else {
				throw new NotFoundException("Medicine with Batch Code " + bCode + " Not found !!!!!!");
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
