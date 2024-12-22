<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@ include file="component/link.jsp"%>
</head>
<body style="background-color: #f7faf8">
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class=" card-body">
						<h4 class="text-center text-success p-3">Login Page</h4>
						<% String logoutMsg=(String)session.getAttribute("logMsg");
						if(logoutMsg!=null){
							%>
							<p class="text-success text-center"><%=logoutMsg %></p>
							<% 
							session.removeAttribute("logoutMsg");
						}
						%>
						<form action="login" method="post">

							<div class="mb-3">
								<label for="exampleInputEmail" class="form-label"><i
									class="bi bi-envelope-fill"></i> Email </label> <input type="email"
									class="form-control" name="email" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword" class="form-label"><i
									class="bi bi-key-fill"></i> Password</label> <input type="password"
									class="form-control" name="password" id="exampleInputPassword">
							</div>


							<div class="text-center mt-3">
								<button type="submit" class="btn btn-primary">Login</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 100px">
		<%@ include file="/component/footer.jsp"%>
	</div>
</body>
</html>