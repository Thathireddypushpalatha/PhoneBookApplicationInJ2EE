<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<%@ include file="component/link.jsp"%>
</head>
<body style="background-color: #f7faf8">
	<%@include file="component/navbar.jsp"%>
	

	<div class="container-fluid">
		<div class="row p-3">
			<div class="col-md-5 offset-md-4">
				<div>
					<div class=" card-body">
						<h4 class="text-center text-success p-3">Registration Page</h4>
						<%
						String success = (String) session.getAttribute("successMsg");
						String error = (String) session.getAttribute("errorMsg");
						if (success != null) {
						%>
						<p class="text-success text-center"><%=success%></p>
						<%
						session.removeAttribute("successMsg");
						}
						if (error != null) {
						%>
						<p class="text-danger text-center"><%=error%></p>
						<%
						session.removeAttribute("errorMsg");
						}
						%>

						<form action="register" method="post">
							<div class="mb-3">
								<label for="exampleInputNmae" class="form-label"><i
									class="bi bi-person-fill"></i> FullName </label> <input type="text"
									class="form-control" name="name" id="exampleInputName"
									aria-describedby="nameHelp">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail" class="form-label"><i
									class="bi bi-envelope-fill"></i> Email </label> <input type="email"
									class="form-control" name="email" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword" class="form-label"><i
									class="bi bi-key"></i> Password</label> <input type="password"
									class="form-control" name="password" id="exampleInputPassword">
							</div>
							<div class="mb-3">
								<label for="exampleInputConfirmPassword" class="form-label"><i
									class="bi bi-key-fill"></i> Confirm Password</label> <input
									type="password" class="form-control" name="re-password"
									id="exampleInputConfirmPassword">
							</div>

							<div class="text-center mt-3">
								<button type="submit" class="btn btn-primary">Register</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 60px">
		<%@ include file="/component/footer.jsp"%>
	</div>

</body>
</html>