<html>
<head>
<title>Delete JSP</title>
</head>
<body>
	
<%@ page import="java.sql.*" %>

	<%

	try{
String accno=request.getParameter("Accno");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankweb","root","");

Statement St = con.createStatement();
Statement Str = con.createStatement();
Statement Strt = con.createStatement();

St.executeUpdate("DELETE FROM `users` WHERE accno='"+accno+"'");
Str.executeUpdate("DELETE FROM `transactions` WHERE accno='"+accno+"'");
Strt.executeUpdate("DELETE FROM `accounts` WHERE accno='"+accno+"'");

response.sendRedirect("admin.jsp");
}catch(Exception E){

				System.out.print(E.toString());	
				
			}
			
	%>

</body>
</html>
