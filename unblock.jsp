<html>
<head>
	<title>unblock jsp</title>
</head>

<body>
<%@ page import="java.sql.*" %>

<%
String accno=request.getParameter("Accno");
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankweb","root","");

Statement St = con.createStatement();
ResultSet Rs = St.executeQuery("SELECT * FROM users WHERE accno='" + accno + "' and active=0");

if(Rs.next()) {

St.executeUpdate("update users set active = 1 where accno='"+accno+"'");
response.sendRedirect("admin.jsp");
}
response.sendRedirect("admin.jsp");
}catch(Exception E) {
				System.out.print(E.toString());
			}

%>

</body>
</html>