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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		User u=new User(name,email,password);
		
		UserDAO user=new UserDAO();
		boolean f=user.UserRegister(u);
		HttpSession session =request.getSession();
		if(f) {
			session.setAttribute("successMsg","User Registered successfully");
			response.sendRedirect("register.jsp");
//			System.out.println("User Registered successfully");
			
		}else {
			session.setAttribute("errorMsg", "Something went wrong");
			response.sendRedirect("register.jsp");
//			System.out.println("Something Went Wrong");
		}
		
		
	}

}
