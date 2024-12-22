package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.ContactDAO;
import com.model.Contact;

@WebServlet("/addContact")
public class AddContact extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId=Integer.parseInt(request.getParameter("userid"));
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String about=request.getParameter("about");
		
		Contact c=new Contact(name,email,phone,about,userId);
		
		ContactDAO dao=new ContactDAO();
		boolean f=dao.saveContact(c);
		HttpSession session=request.getSession();
		if(f) {
			session.setAttribute("successMsg", "Your Contact Saved ");
			response.sendRedirect("addContact.jsp");
		}else {
			session.setAttribute("errorMsg", "Something Went Wrong ");
			response.sendRedirect("addContact.jsp");
		}
		
	}

}
