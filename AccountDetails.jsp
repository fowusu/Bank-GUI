<html>
<% String accno = request.getParameter("Accno"); %>
<head>
	<title>Account Details</title>
</head>
<body>
<link rel="stylesheet" href="bankStyle.css"></link>	
<ul>
  <li><a class="active" href="index.html">Home</a></li>
  <li><a href="http://localhost:8080/bnk/login.html">Login</a></li>
  <li><a href="http://localhost:8080/bnk/createAccount.html">Create Account</a></li>
  <li><a href="http://localhost:8080/bnk/edit.jsp?Accno=<%=accno%>">Edit Account</a></li>
  <li><a href="http://localhost:8080/bnk/logout.jsp">Logout</a></li>
  <li style="position: absolute; bottom: 0;"><img src="bnk.png"></li>
</ul>

<div style="margin-left:25%;padding:1px 16px;height:1000px;font-family: Sans-serif;">
<h1>Account Details</h1>
<%@ page import="java.sql.*" %>

<%

if((Integer)session.getAttribute("role")==1){
int amountTotal=0; 
Connection con=null;
try{

Class.forName("com.mysql.cj.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://localhost/bankweb","root","");

Statement St = con.createStatement();
Statement Str = con.createStatement();
Statement Strt = con.createStatement();
Statement Dp = con.createStatement();

ResultSet Rs = St.executeQuery("SELECT * FROM `users` WHERE accno = '"+ accno +"' ");
ResultSet Rsd = Str.executeQuery("SELECT * FROM `accounts` WHERE accno = '"+ accno +"' ");
ResultSet Rst = Strt.executeQuery("SELECT * FROM `transactions` WHERE accno = '"+ accno +"' ");

ResultSet dpStr =Dp.executeQuery("SELECT SUM(amount)FROM transactions WHERE ACCNO = '"+ accno +"' AND TYPE ='D'");
dpStr.next();
int dep = dpStr.getInt(1);
ResultSet wdStr = Dp.executeQuery("SELECT SUM(amount)FROM transactions WHERE ACCNO = '"+ accno +"' AND TYPE ='W'");
wdStr.next();
int with = wdStr.getInt(1);
amountTotal = dep - with;

Rs.next();
Rsd.next();

out.print("AccountNo: "+ accno +"<br>");
out.print("Current Balance: "+ amountTotal +"<br>");
out.print("Username: " +Rs.getString(2)+ "<br>");
out.print("Name: "+Rsd.getString(2) +"<br>");
out.print("Adress: "+Rsd.getString(3) +"<br><br>");


out.print("<form action='http://localhost:8080/bnk/depositAction.jsp?Accno=" + accno + "' method='Post' > Deposit Amount : <input type='text' name='amount'><input type='submit'></form>");

if(amountTotal > 0 ){
out.print("<form action='http://localhost:8080/bnk/withdrawAction.jsp?Accno=" + accno + "' method='Post' > Withdraw Amount : <input type='text' name='amount'><input type='submit'></form>");
}else{
out.print("insuffecient funds");
}

out.print("<div style='overflow: auto;background-color: #eee;width: 310px;height: 200px;border: 1px dotted black;'>");
while(Rst.next()){
out.print("<Table Border=1>");	
out.print("<TR>"+"<TD>ACCNO</TD><TD>AMOUNT</TD><TD>DATE</TD><TD>TYPE</TD></TR>");
out.print("<TD>"+accno+"</TD>"+"<TD>"+Rst.getInt(2)+"</TD>"+"<TD>"+Rst.getString(3)+"</TD>"+"<TD>"+Rst.getString(4)+"</TD>"+"</TR>");
}
}
catch(Exception E){

	out.print(E.toString());

}finally{
    con.close(); 
}

}

if((Integer)session.getAttribute("role")==2){
int amountTotal=0; 
Connection con=null;
try{


Class.forName("com.mysql.cj.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://localhost/bankweb","root","");

Statement St = con.createStatement();
Statement Str = con.createStatement();
Statement Strt = con.createStatement();
Statement Dp = con.createStatement();

ResultSet Rs = St.executeQuery("SELECT * FROM `users` WHERE accno = '"+ accno +"' ");
ResultSet Rsd = Str.executeQuery("SELECT * FROM `accounts` WHERE accno = '"+ accno +"' ");
ResultSet Rst = Strt.executeQuery("SELECT * FROM `transactions` WHERE accno = '"+ accno +"' ");

ResultSet dpStr =Dp.executeQuery("SELECT SUM(amount)FROM transactions WHERE ACCNO = '"+ accno +"' AND TYPE ='D'");
dpStr.next();
int dep = dpStr.getInt(1);
ResultSet wdStr = Dp.executeQuery("SELECT SUM(amount)FROM transactions WHERE ACCNO = '"+ accno +"' AND TYPE ='W'");
wdStr.next();
int with = wdStr.getInt(1);
amountTotal = dep - with;

Rs.next();
Rsd.next();


out.print("AccountNo: "+ accno +"<br>");
out.print("Current Balance: "+ amountTotal +"<br>");
out.print("Username: " +Rs.getString(2)+ "<br>");
out.print("Name: "+Rsd.getString(2) +"<br>");
out.print("Adress: "+Rsd.getString(3) +"<br><br>");

out.print("<div style='overflow: auto;background-color: #eee;width: 310px;height: 200px;border: 1px dotted black;'>");

while(Rst.next()){

out.print("<Table Border=1>");	
out.print("<TR>"+"<TD>ACCNO</TD><TD>AMOUNT</TD><TD>DATE</TD><TD>TYPE</TD></TR>");
out.print("<TD>"+accno+"</TD>"+"<TD>"+Rst.getInt(2)+"</TD>"+"<TD>"+Rst.getString(3)+"</TD>"+"<TD>"+Rst.getString(4)+"</TD>"+"</TR>");
}
}catch(Exception E){

	out.print(E.toString());

}
finally{
    con.close(); 
}
}

%>
</div>

</body>

</html>