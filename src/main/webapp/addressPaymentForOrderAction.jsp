<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<% 
	String email = session.getAttribute("email").toString();
	String address = request.getParameter("address");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String country = request.getParameter("country");
	String mobileNumber = request.getParameter("mobileNumber");
	String paymentMethod = request.getParameter("paymentMethod");
	String transactionId = "";
	transactionId = request.getParameter("transactionId");
	String status = "bill";
	
	try{
		Connection con = ConnectionProvider.getCon();
		PreparedStatement ps = con.prepareStatement("update users set address=?, city=?, state=?, country=?, mobileNumber=? where email=?");
		ps.setString(1, address);
		ps.setString(2, city);
		ps.setString(3, state);
		ps.setString(4, country);
		ps.setString(5, mobileNumber);
		ps.setString(6, email);
		ps.executeUpdate();
		
		PreparedStatement ps1 = con.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobileNumber=?orderDate=now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 7 DAY), paymentMethod=?,transactionId=?,status=? where email=? and address is NULL");
		ps.setString(1, address);
		ps.setString(2, city);
		ps.setString(3, state);
		ps.setString(4, country);
		ps.setString(5, mobileNumber);
		ps.setString(6, paymentMethod);
		ps.setString(7, transactionId);
		ps.setString(8, status);
		ps.setString(9, email);
		ps.executeUpdate();
		response.sendRedirect("bill.jsp");
		
	}catch(Exception e){
		System.out.println(e);
	}
%>