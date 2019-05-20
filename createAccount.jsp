<html>
<head>
	<title>createAccount jsp</title>
</head>
<body>
<%@ page import="java.sql.*" %>

	<%
    String name=request.getParameter("name");
    String gender=request.getParameter("gender");
    String adress=request.getParameter("adress");
	String username=request.getParameter("username");
    String password=request.getParameter("password");
    String confirmPasswrd=request.getParameter("password2");
    String accType=request.getParameter("accType"); 
    String genderFrm=""; 
    ResultSet Rs=null;

   try {
                if(gender.equals("male")){
                genderFrm="M";

                }
                 if(gender.equals("female")){
                 genderFrm="F";
                }
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankweb","root","");
			Statement St = con.createStatement();
			
			if (accType.equals("current")) {
			
			  Rs = St.executeQuery("SELECT MAX(SUBSTRING(ACCNO,3,3))+1 as T From users WHERE SUBSTRING(ACCNO,1,1) = 'C'");
			  accType = "C";
			
			}
			if (accType.equals("savings")) {
				
			Rs = St.executeQuery("SELECT MAX(SUBSTRING(ACCNO,3,3))+1 as T From users WHERE SUBSTRING(ACCNO,1,1) = 'S'");
				accType = "S";
				}
			
			Rs.next(); 
			
			int newAccNo=Rs.getInt(1); 
			
			St.executeUpdate("insert into users values("+"'"+accType+genderFrm+newAccNo+"'"+","+"'"+username+"'"+","+"'"+password+"'"+","+"'"+1+"'"+","+"'"+1+"')"); 

			St.executeUpdate("insert into accounts values("+"'"+accType+genderFrm+newAccNo+"'"+","+"'"+name+"'"+","+"'"+adress+"')"); 
			
			response.sendRedirect("login.html"); 

		}catch(Exception E) {

			out.print(E.toString());

		}

	%>

</body>
</html>