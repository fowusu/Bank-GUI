<html>
<head>
<title>Edit JSP</title>
</head>

<body>
<link rel="stylesheet" href="bankStyle.css"></body></link>	
<ul>
  <li><a class="active" href="index.html">Home</a></li>
  <li><a href="http://localhost:8080/bnk/login.html">Login</a></li>
  <li><a href="http://localhost:8080/bnk/createAccount.html">Create Account</a></li>
  <li style="position: absolute; bottom: 0;"><img src="bnk.png"></li>
</ul>
<div style="margin-left:25%;padding:1px 16px;height:1000px;font-family: sans-serif;">
<%@ page import="java.sql.*"%>

<%

try{
String accno=request.getParameter("Accno");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankweb","root","");

Statement St = con.createStatement();
Statement Str = con.createStatement();

ResultSet Rs = St.executeQuery("select * from accounts where accno='"+accno+"'");
Rs.next();
ResultSet Rst = Str.executeQuery("select * from users where accno='"+accno+"'");
Rst.next();

%>

<form action="http://localhost:8080/bnk/updateAccount.jsp"  style="font-size: 12px">

ACCOUNT NUMBER : <input required type="" name="Accno" value="<%= accno %>" style="position: absolute; left: 500px;"><br><br>
NAME: <input required type="text" value="<%= Rs.getString(2) %>" name="name" style="position: absolute; left: 500px;"><br><br>
ADDRESS: <input required type="text" value="<%= Rs.getString(3) %>" name="adress" style="position: absolute; left: 500px;"><br><br>
ACCOUNT TYPE: <select name="accType" style="position: absolute; left: 500px;">
 <option value="current">current</option>
 <option value="savings">savings</option>
</select><br><br>
USERNAME: <input required type="text" name="username" value="<%= Rst.getString(2) %>" style="position: absolute; left: 500px; "><br><br>
PASSWORD: <input required type="password" name="password" style="position: absolute; left: 500px; "><br><br>
CONFIRM PASSWORD: <input required type="password" name="password2" style="position: absolute; left: 500px;"><br><br>
<input required type="submit" style="position: absolute; left: 500px;">

</form>

<%

}catch(Exception E){
		System.out.print(E.toString());	
		}


%>
</body>
<div>


</html>