package com.controller;

import java.io.IOException;

import com.dao.ContactDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteContact")
public class DeleteContact extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid=Integer.parseInt(request.getParameter("cid"));
		
		ContactDAO dao=new ContactDAO();
		boolean f=dao.deleteContactById(cid);
		System.out.println(f);
		HttpSession session=request.getSession();
		if(f) {
			session.setAttribute("successMsg", "Contact Delete Successfully..");
			response.sendRedirect("viewContact.jsp");
		}else {
			session.setAttribute("errorMsg", "Something Went Wrong");
			response.sendRedirect("viewContact.jsp");
		}
	}

}
