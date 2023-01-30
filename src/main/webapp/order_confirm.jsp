<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.Item_Order"%>
<%@page import="com.DAO.ItemOrderImpl"%>
<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.User"%>
<%
	String username1 = request.getParameter("username");
String email1 = request.getParameter("email");
String phno1 = request.getParameter("phno");
String address1 = request.getParameter("address");

User u = (User) session.getAttribute("userobj");

CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());

List<Cart> blist = dao.getBookByUser(u.getId());

ItemOrderImpl dao2 = new ItemOrderImpl(DBConnect.getConn());

Item_Order o = null;

ArrayList<Item_Order> orderList = new ArrayList<Item_Order>();
Random r = new Random();
for (Cart c : blist) {
	o = new Item_Order();
	o.setOrderId("BOOK-ORD-00" + r.nextInt(1000));
	o.setUserName(username1);
	o.setEmail(email1);
	o.setPhno(phno1);
	o.setFulladd(address1);
	o.setBookName(c.getBookName());
	o.setAuthor(c.getAuthor());
	o.setPrice(c.getPrice() + "");
	o.setPaymentType("Online Payment");

	orderList.add(o);

}

boolean f = dao2.saveOrder(orderList);

if (f) {
	response.sendRedirect("order_success.jsp");
} else {
	session.setAttribute("failedMsg", "Your Order Failed");
	response.sendRedirect("checkout.jsp");
}
%>