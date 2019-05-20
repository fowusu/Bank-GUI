<html>
<head>
	<title>login jsp</title>
</head>

<body>
	
<%@ page import="java.sql.*" %>

<%

String username=request.getParameter("username");
String password=request.getParameter("password");
Connection con=null;

try{

        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/bankweb","root","");
        Statement St = con.createStatement();
        Statement Str = con.createStatement();
        
        String query= ("SELECT * FROM USERS WHERE USERNAME='"+username+"' and Password='" + password+"';"); 

        ResultSet Rs=St.executeQuery(query);

        if(Rs.next()){

        if(Rs.getInt(4)==2){

        session.setAttribute("username",username);
        session.setAttribute("role",2);
        session.setAttribute("name",Rs.getString(2));
        response.sendRedirect("admin.jsp"); 

    }
    else{ 
    if(Rs.getInt(5)==0){
      out.println("you are blocked");
      }
    if(Rs.getInt(5)==1){
        session.setAttribute("username",username);
        session.setAttribute("role",1);
        session.setAttribute("name",Rs.getString(2));
        response.sendRedirect("AccountDetails.jsp?Accno=" + Rs.getString(1));
      }
}
  } 
  out.print("enter correct username or password"); 
}catch(Exception E){

	out.print(E.toString());
}finally{
    con.close(); 
}

%>

</body>
</html>