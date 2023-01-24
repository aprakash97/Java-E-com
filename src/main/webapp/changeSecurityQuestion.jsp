<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>
<%
	String msg = request.getParameter("msg");

		if("done".equals(msg)){
	%>
	<h3 class="alert">Your security Question successfully changed !</h3>
	<% } 
		
		if("wrong".equals(msg)){
	%>	
	<h3 class="alert">Your Password is wrong!</h3>
	<% } %>


<form action="changeSecurityQuestionAction.jsp" method="post">
<h3>Select Your New Security Question</h3>
  <select class="input-style" name="securityQuestion">
      	<option value="Your first pets name? ">Your first pet's name? </option>
      	<option value="Name of your nursery you went?"> Name of your nursery you went?</option>
      	<option value="Your dream Car?">Your dream Car? </option>
      	<option value="Your hometown name?"> Your hometown name?</option>
   </select>
 <hr>
 <h3>Enter Your New Answer</h3>
 <input type="text" class="input-style" name="newAnswer"  placeholder="Enter Your New answer" required>
<hr>
<h3>Enter Password (For Security)</h3>
<input type="password" class="input-style" name="password" placeholder="Enter Password(for security)" required>
<hr>
 <button class="button" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>