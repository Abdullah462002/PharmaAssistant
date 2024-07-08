package com.pharma.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pharma.bean.User;
import com.pharma.business.LoginBo;
import com.pharma.exception.InvalidUserException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String name = request.getParameter("username");
		String pass = request.getParameter("password");
		session.setAttribute("na", name);
		session.setAttribute("page", "init");
		var u = new User(name, pass);
		var lbo = new LoginBo();
		try {
			lbo.validateUser(u);
			Cookie coo = new Cookie("uname", name);
			coo.setMaxAge(2000);
			response.addCookie(coo);
			homePage(response);
		} catch (InvalidUserException e) {
			session.setAttribute("error", e.getMessage());
			try {
				response.sendRedirect("index.jsp");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	}

	private void homePage(HttpServletResponse response) {
		try {
			response.sendRedirect("home.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
