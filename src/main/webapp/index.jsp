<%@page import="com.entity.User"%>
<%@page import="com.entity.ItemDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.ItemDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: linear-gradient(rgba(0, 0, 0, .1), rgba(0, 0, 0, .1)),
		url("img/w.jpg");
	height: 55vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}

.paint-card {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}
</style>


</head>
<body style="background-color: #f7f7f7;">

	<%
		User u = (User) session.getAttribute("userobj");
	%>



	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<!--  <h2 class="text-center text-success">TopFashion Baazar</h2>-->
	</div>


	<!-- Start Recent Item -->

	<div class="container">
		<h3 class="text-center">Recent Item</h3>
		<div class="row">
			<%
				ItemDAOImpl dao2 = new ItemDAOImpl(DBConnect.getConn());
					List<ItemDtls> list2 = dao2.getRecentBooks();
					for (ItemDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho paint-card">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>

							<%
								if (b.getBookCategory().equals("Old")) {
							%>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fas fa-rupee-sign"></i></a>
						</div>
						<%
							} else {
						%>
						Categories:<%=b.getBookCategory()%></p>
						<div class="row">


							<%
								if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"> Add
								Cart</a>
							<%
								} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"> Add Cart</a>
							<%
								}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm "><%=b.getPrice()%><i
								class="fas fa-rupee-sign"></i></a>
						</div>
						<%
							}
						%>


					</div>
				</div>
			</div>
			<%
				}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>

	</div>
	<!-- End Recent Book -->

	<hr>

	<!-- Start New  Items-->

	<div class="container">
		<h3 class="text-center">New Items</h3>
		<div class="row">


			<%
				ItemDAOImpl dao = new ItemDAOImpl(DBConnect.getConn());
					List<ItemDtls> list = dao.getNewBook();
					for (ItemDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho paint-card">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:<%=b.getBookCategory()%></p>

						<div class="row">

							<%
								if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1"> Add
								Cart</a>
							<%
								} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-1">Add Cart</a>
							<%
								}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1"> View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fas fa-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>

	</div>
	<!-- End New Items -->
	<hr>

	<!-- Start Old Items -->

	<div class="container">
		<h3 class="text-center">Old Items</h3>
		<div class="row">


			<%
				ItemDAOImpl dao3 = new ItemDAOImpl(DBConnect.getConn());
					List<ItemDtls> list3 = dao2.getOldBooks();
					for (ItemDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho paint-card">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>

						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fas fa-rupee-sign"></i></a>
						</div>

					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>

	</div>
	<!-- End Old Items -->


	<%@include file="all_component/footer.jsp"%>

</body>
</html>