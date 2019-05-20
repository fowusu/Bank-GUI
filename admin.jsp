<html>
<head>
	<title>admin jsp</title>
</head>
<body>
<link rel="stylesheet" href="bankStyle.css"></body></link>	
<ul>
  <li><a class="active" href="index.html">Home</a></li>
  <li><a href="http://localhost:8080/bnk/login.html">Login</a></li>
  <li><a href="http://localhost:8080/bnk/createAccount.html">Create Account</a></li>
  <li><a href="logout.jsp">Logout</a></li>
  <li style="position: absolute; bottom: 0;"><img src="bnk.png"></li>
</ul>
<div style="margin-left:25%;padding:1px 16px;height:1000px;">
<%@ page import="java.sql.*" %>

	<%

if((Integer)session.getAttribute("role")==2){

int sno=1;
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankweb","root","");
Statement St = con.createStatement();
Statement Str = con.createStatement();
ResultSet Rs = St.executeQuery("select * from accounts");
ResultSet Rst = Str.executeQuery("select * from users");


out.print("<Table Border=1>");
out.print("<TR><TD>S.NO</TD><TD>ACCOUNTNO</TD><TD>NAME</TD><TD>OPERATION</TD><TD>ACTIVE?</TD></TR>");
Rst.next(); 

while(Rs.next()){
Rst.next(); 
out.print("<TR><TD>" + sno + "</TD>");
out.print("<TD><a href = http://localhost:8080/bnk/AccountDetails.jsp?Accno="+Rs.getString(1)+">"+Rs.getString(1)+"</a>"+"</TD>"+"<TD>"+Rs.getString(2)+"</TD>"+"<TD><a href = http://localhost:8080/bnk/edit.jsp?Accno=" +Rs.getString(1)+ ">Edit</a><a href = http://localhost:8080/bnk/block.jsp?Accno="+Rs.getString(1)+">,Block</a><a href = http://localhost:8080/bnk/unblock.jsp?Accno="+Rs.getString(1)+">,Unblock</a><a href = http://localhost:8080/bnk/delete.jsp?Accno="+Rs.getString(1)+">,Delete</a></TD>"+"<TD>"+Rst.getInt(5)+"</TD>"+"</TR>");
sno++; 
}
}


	%>

</body>
</div>
</html>