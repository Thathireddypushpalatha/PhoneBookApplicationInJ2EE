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

@WebServlet("/Update")
public class EditContact extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid=Integer.parseInt(request.getParameter("cid"));
		System.out.println(cid);
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String about=request.getParameter("about");
		
		Contact c=new Contact();
		c.setName(name);
		c.setEmail(email);
		c.setPhone(phone);
		c.setAbout(about);
		
		ContactDAO dao=new ContactDAO();
		boolean f=dao.updateContact(c,cid);
		System.out.println(f);
		HttpSession session=request.getSession();
		if(f) {
			session.setAttribute("successMsg", "Your Contact Updated");
			response.sendRedirect("viewContact.jsp");
		}else {
			session.setAttribute("errorMsg", "Contact is not Updated");
			response.sendRedirect("editContact.jsp?cid="+cid);
		}
	}

}
