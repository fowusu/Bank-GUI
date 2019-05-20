<html>
<head>
	<title>Deposit jsp</title>
</head>
<body style="font-family: sans-serif">

<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>

<%

try{
String amount=request.getParameter("amount");
String accno=request.getParameter("Accno");
out.print(amount);
int amountInt = Integer.parseInt(amount); 

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankweb","root","");
Statement St = con.createStatement();

ResultSet Rs = St.executeQuery("SELECT * FROM users WHERE accno='" + accno + "'");

if(Rs.next()) {
St.executeUpdate("insert into transactions values("+"'"+accno+"'"+","+"'"+ amountInt +"'"+","+"sysdate(),'D')");

response.sendRedirect("AccountDetails.jsp?Accno="+accno);

}

}catch(Exception E) {
				System.out.print(E.toString());
				
			}


%>





</body>
</html>