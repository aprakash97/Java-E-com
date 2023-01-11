<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<% 
	String msg= request.getParameter("msg");
	if("notPossible".equals(msg)){
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%  } 
 
	if("inc".equals(msg)){
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%  } 
 
	if("dec".equals(msg)){
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>

<%  } 
 
	if("removed".equals(msg)){
%>
<h3 class="alert">Product Successfully Removed!</h3>
<%} %>

<table>
<thead>
		<%
			try{
				int total =0;
				int sno = 0;
				
				
			}catch(Exception e){
				System.out.println(e);
			}
		
		%>
          <tr>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i> </th>
            <th scope="col"><a href="">Proceed to order</a></th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      
          <tr>

           <td></td>
            <td></td>
            <td></td>
            <td><i class="fa fa-inr"></i> </td>
            <td><a href=""><i class='fas fa-plus-circle'></i></a>  <a href=""><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i> </td>
            <td><a href="">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>

        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>