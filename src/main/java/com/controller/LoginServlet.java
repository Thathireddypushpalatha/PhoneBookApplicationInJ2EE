package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.UserDAO;
import com.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		UserDAO dao=new UserDAO();
		User u=dao.loginUser(email, password);
		HttpSession session=request.getSession();
		if(u!=null) {
			session.setAttribute("user", u);
			response.sendRedirect("index.jsp");
//			System.out.println("User is avaliable: " + u);
		}else {
			session.setAttribute("invalidMessage", "Invalid Email & Password");
			response.sendRedirect("login.jsp");
//			System.out.println("User is not avaliable: " + u);
		}
	}

}
