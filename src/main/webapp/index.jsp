<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Main Page</title>
<%@include file="component/link.jsp"%>
<style type="text/css">
.back_img {
	background: url("images/bg_img.jpg");
	width: 100%;
	height: 90Vh;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	
	<div class="container-fluid back_img text-center text-success">
		<h2>Welcome to PhoneBook App</h2>
	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>