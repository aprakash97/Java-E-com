<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%

	String email = session.getAttribute("email").toString();
	String mobileNumber = request.getParameter("mobileNumber");
	String password = request.getParameter("password");
	
	try{
		Connection con = ConnectionProvider.getCon();	
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM users WHERE email ='"+email+"' and password='"+password+"'");
		
		if(rs.next()){
			st.executeUpdate("UPDATE USERS SET mobileNumber='"+mobileNumber+"' where email='"+email+"' and password='"+password+"'");
			response.sendRedirect("changeMobileNumber.jsp?msg=done");
		}else{
			response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
		}
		
	}catch(Exception e){
		System.out.println(e);
	}
%>