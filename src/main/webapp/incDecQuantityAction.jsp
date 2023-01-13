<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<% 
	String email = session.getAttribute("email").toString();
	String id = request.getParameter("id");
	String incDec = request.getParameter("quantity");  //quantity=inc/dec
	int price = 0;
	int total =0;
	int quantity = 0;
	int final_total = 0;

	try{
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from cart where email='"+email+"' and product_id='"+id+"' and address is NULL");
		
		while(rs.next()){
			price=rs.getInt(4);
			total=rs.getInt(5);
			quantity = rs.getInt(3);
			//System.out.println(quantity); works qauntity > 1 check else in sql
		}
		
		if(quantity == 1 && incDec.equals("dec")){
			response.sendRedirect("myCart.jsp?msg=notPossible");
		}else if(quantity != 1 && incDec.equals("dec")){
			total = total - price;
			quantity = quantity -1 ;
			st.executeUpdate("update cart set total= '"+total+"', quantity= '"+quantity+"' where email ='"+email+"' and product_id='"+id+"' and address is NULL");
			
			response.sendRedirect("myCart.jsp?msg=dec");
		}else{
			total = total + price;
			quantity = quantity + 1 ;
			st.executeUpdate("UPDATE cart set total= '"+total+"', quantity= '"+quantity+"' where email ='"+email+"' and product_id='"+id+"' and address is NULL");
			response.sendRedirect("myCart.jsp?msg=inc");
		}
		
	}catch(Exception e){
		System.out.println(e);
	}
	
%>