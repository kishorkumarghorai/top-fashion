<%@page import="com.entity.User"%>
<%@page import="com.entity.ItemDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ItemDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<%
		User u = (User) session.getAttribute("userobj");
	%>
	<%
		int bid = Integer.parseInt(request.getParameter("bid"));
			ItemDAOImpl dao = new ItemDAOImpl(DBConnect.getConn());
			ItemDtls b = dao.getBookById(bid);
	%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white paint-card">
				<img src="book/<%=b.getPhotoName()%>"
					style="height: 250px; width: 200px"><br>

			</div>

			<div class="col-md-6  p-5 border bg-white paint-card">
				<h2 class=""><%=b.getBookName()%></h2>
				<div class="">
					<h5 class="mt-3">
						Book Name: <span class="text-success"><%=b.getBookName()%></span>
					</h5>
					<h5>
						Author Name: <span class="text-success"><%=b.getAuthor()%></span>
					</h5>
					<h5>
						Category:<span class="text-success"> <%=b.getBookCategory()%></span>
					</h5>
				</div>
				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<h5 class="text-primary">Contact To Seller</h5>
				<h5 class="text-primary">
					<i class="far fa-envelope"></i> Email:
					<%=b.getEmail()%></h5>
				<%
				}
				%>

				<%
				if ("New".equals(b.getBookCategory())) {
				%>
				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>


				</div>
				<%
				}
				%>
				<%
				if ("Old".equals(b.getBookCategory())) {
				%>

				<div class="text-center p-3">
					<%-- <a href="messages.jsp?bid=<%=b.getBookId()%>"
						class="btn btn-warning text-white"><i class="fa fa-comment"
						aria-hidden="true"></i> Mail</a> --%> <a href="index.jsp"
						class="btn btn-success"><i class="fas fa-cart-plus"></i>
						Continue Shopping</a> <a href="" class="btn btn-danger"><i
						class="fas fa-rupee-sign"></i>200</a>
				</div>
				<%
				} else {
				%>
				<div class=" text-center p-3">
					<%
					if (u == null) {
					%>
					<a href="login.jsp" class="btn btn-primary btn-sm ml-2"><i
						class="fas fa-cart-plus"></i> Add Cart</a>
					<%
					} else {
					%>
					<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
						class="btn btn-primary btn-sm ml-2"><i
						class="fas fa-cart-plus"></i> Add Cart</a>
					<%
					}
					%>
					<a href="" class="btn btn-danger btn-sm"><i
						class="fas fa-rupee-sign"></i>200</a>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>