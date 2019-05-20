<!DOCTYPE html>
<html>
<head>
	<title>update account</title>
</head>
<body>
<%@ page import="java.sql.*" %>

	<%
	String accno=request.getParameter("Accno");
    String name=request.getParameter("name");
    String adress=request.getParameter("adress");
	String username=request.getParameter("username");
    String password=request.getParameter("password");
    String confirmPasswrd=request.getParameter("password2");
   

   try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankweb","root","");
			Statement St = con.createStatement();
			
			St.executeUpdate("update users set username='"+username+"', password='"+password+"', role=1, active=1 where accno='"+accno+"'"); 
			out.println("Users work");
			
			St.executeUpdate("UPDATE accounts set name ='"+name+"', address='"+adress+"' where accno = '"+accno+"'");
			out.println("Accounts work");
			response.sendRedirect("admin.jsp"); 

		}catch(Exception E) {

			out.print(E.toString());

		}

	%>
</body>
</html>