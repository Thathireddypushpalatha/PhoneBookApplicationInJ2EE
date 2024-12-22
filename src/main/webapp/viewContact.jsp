<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View Contact</title>
    <%@include file="component/link.jsp"%>
    <%@page import="java.sql.Connection"%>
    <%@page import="com.dbconnect.DBConnection"%>
    <%@page import="com.dao.ContactDAO"%>
    <%@page import="com.model.Contact"%>
    <%@page import="java.util.List"%>
    <style>
        .card-hover {
            background-color: #f7f7f7;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 20px;
            padding: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .container {
            margin-top: 20px;
        }
        .alert {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <%@include file="component/navbar.jsp"%>
    
    <%
        if (user == null) {
            session.setAttribute("logMsg", "Please log in.");
            response.sendRedirect("login.jsp");
        }
    %>

    <!-- Display success or error messages -->
    <%
        String success = (String) session.getAttribute("successMsg");
        String error = (String) session.getAttribute("errorMsg");
        if (success != null) {
    %>
        <div class="alert alert-success" role="alert"><%= success %></div>
    <%
            session.removeAttribute("successMsg");
        }
        if (error != null) {
    %>
        <div class="alert alert-danger text-center"><%= error %></div>
    <%
            session.removeAttribute("errorMsg");
        }
    %>

    <div class="container">
        <div class="row">
            <%
                if (user != null) {
                    Connection con = DBConnection.getConnection();
                    ContactDAO dao = new ContactDAO();
                    List<Contact> contacts = dao.getAll();

                    if (contacts != null && !contacts.isEmpty()) {
                        for (Contact c : contacts) {
            %>
            <div class="col-md-3">
                <div class="card card-hover">
                    <div class="card-body">
                        <h5 class="card-title">Name: <%= c.getName() %></h5>
                        <p class="card-text">Phone: <%= c.getPhone() %></p>
                        <p class="card-text">Email: <%= c.getEmail() %></p>
                        <p class="card-text">About: <%= c.getAbout() %></p>
                        <div class="text-center">
                            <a href="editContact.jsp?cid=<%= c.getId() %>" class="btn btn-success btn-sm text-white">Edit</a>
                            <a href="deleteContact?cid=<%= c.getId() %>" class="btn btn-danger btn-sm text-white">Delete</a>
                        </div>
                    </div>
                </div>
            </div>
            <%
                        }
                    } else {
            %>
            <div class="col-12">
                <p class="text-center text-muted">No contacts found.</p>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</body>
</html>
