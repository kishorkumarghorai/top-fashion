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
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
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
			</div>

			<div class="col-md-6  p-3 border bg-white paint-card">
				<h4 class="text-center text-primary">Send Mail</h4>
				<c:if test="${not empty succMsg }">
					<h5 class="text-center text-success">${succMsg}</h5>
					<c:remove var="succMsg" scope="session" />
				</c:if>

				<form action="sendmail" method="post">
					<div class="form-group">
						<label>Name</label> <input type="text" value="${userObj.name}"
							name="name" class="form-control">
					</div>
					<input type="hidden" name="email" value="<%=b.getEmail()%>">
					<input type="hidden" name="bid" value="<%=b.getBookId()%>">
					<div class="form-group">
						<label>Message</label>
						<textarea rows="4" cols="" name="msg" class="form-control"></textarea>
					</div>
					<div class="text-center">
						<button class="btn btn-danger">Send</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>