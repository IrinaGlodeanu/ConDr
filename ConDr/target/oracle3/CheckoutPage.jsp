<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 21-Apr-17
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
         pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
    <title>Login Success Page</title>
</head>
<body>
<%
    String userName = null;
    String sessionID = null;
    Cookie[] cookies = request.getCookies();
    if(cookies !=null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("name")) userName = cookie.getValue();
        }
    }
%>
<h3>Buna <%=userName %>, aici inchideti sesiunea curenta.</h3>
<br>
<form action="LogoutServlet" method="post">
    <input type="submit" value="Logout" >
</form>
</body>
</html>