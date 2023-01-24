<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
	String email = session.getAttribute("email").toString();
	String securityQuestion = request.getParameter("securityQuestion");
	String newAnswer = request.getParameter("newAnswer");
	String password = request.getParameter("password");

	int check = 0;
	
	try{
		Connection con = ConnectionProvider.getCon();	
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM users WHERE email ='"+email+"' and password='"+password+"'");
		
		if(rs.next()){
			check=1;
			st.executeUpdate("UPDATE USERS set securityQuestion='"+securityQuestion+"',answer='"+newAnswer+"' where email='"+email+"'");
			response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
		}else{
			response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
		}
		
	}catch(Exception e){
		System.out.println(e);
	}
%>