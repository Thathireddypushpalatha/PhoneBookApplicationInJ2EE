<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<a class="navbar-brand" href="index.jsp"><i
		class="fa-solid fa-phone"></i> PhoneBook</a>
	<button class="navbar-toggler" type="button"
		data-bs-toggle="collapse
		
		data-bs-target="
		#navbarSupportedContent"
		aria-controls="navbarSupportedContent"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav me-auto ">
			<li class="nav-item active"><a class="nav-link "
				href="index.jsp"><i class="fa-solid fa-house"></i> Home </span></a></li>
			<li class="nav-item active"><a class="nav-link"
				href="addContact.jsp"><i class="fa-solid fa-plus"></i>Add Phone
					No</a></li>

			<li class="nav-item active"><a class="nav-link "
				href="viewContact.jsp"><i class="fa-regular fa-eye"></i> View
					Contact</a></li>
		</ul>
		<%@ page import="com.model.User"%>
		<%
		User user = (User) session.getAttribute("user");
		if (user == null) {
		%>
		<form class="form-inline ml-auto my-2 my-lg-0">
			<a href="login.jsp" class="btn btn-success"><i
				class="fa-solid fa-user"></i> Login</a> <a href="register.jsp"
				class="btn btn-danger ml-2"><i class="fa-solid fa-user-plus"></i>
				Register</a>
		</form>
		<%
		} else {
		%>
		<form class="form-inline ml-auto my-2 my-lg-0">
			<button class="btn btn-success"><%=user.getName()%></button>
			<a href="logout" class="btn btn-danger ml-2 text-white" data-bs-toggle="modal"
				data-bs-target="#exampleModal">Logout</a>
		</form>
		<%
		}
		%>

	</div>
	<!-- modal for the logout pop window -->



	<!-- Modal -->
	<!-- <div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal Title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-center">
				<h6>Do You Want Logout</h6>
				<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<a href="logout" class="btn btn-primary">Logout</a></div>
				<div class="modal-footer">
					
				</div>
			</div>
		</div>
	</div> -->




</nav>