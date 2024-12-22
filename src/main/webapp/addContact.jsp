
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/link.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%
	if (user == null) {
		session.setAttribute("logMsg", "login Please...");
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="container-fluid">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success p-3">AddContact Page</h4>
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
						<form action="addContact" method="post">
							<%
							if (user != null) {
							%>
							<input type="hidden" value="<%=user.getId()%>"
								name="userid">

							<%
							}
							%>
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
								<label for="exampleInputEmail" class="form-label"><i
									class="bi bi-telephone-fill"></i> phone number</label> <input
									type="text" class="form-control" name="phone"
									id="exampleInputPhone" aria-describedby="phoneHelp">
							</div>
							<div class="form-floating">
								<textarea class="form-control" placeholder="Enter About"
									name="about" id="floatingTextarea"></textarea>

							</div>


							<div class="text-center mt-3">
								<button type="submit" class="btn btn-primary">Save
									Contact</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 40px">
		<%@ include file="/component/footer.jsp"%>
	</div>

</body>
</html>