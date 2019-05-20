
<html>
<head>
	<title>logout</title>
</head>
<body>
<%@ page import="java.sql.*" %>

<%

 try{

        session.invalidate();
        response.sendRedirect("login.html"); 

    }catch(Exception E) {

				System.out.print(E.toString());

			}
%>

</body>
</html>