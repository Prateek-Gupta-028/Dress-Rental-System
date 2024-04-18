<%-- 
    Document   : logout
    Created on : 30 Oct, 2022, 3:32:33 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        session.removeValue("email");
        session.removeValue("uname");
        session.removeValue("phone");
        session.invalidate();
        response.setHeader("Cache-Control","no-cache");//HTTP 1.1
        response.setHeader("Pragma","no-cache");//HTTP 1.0
        response.setDateHeader("Expires",0);
        response.setHeader("Cache-Control","no-store");
        response.sendRedirect("login.jsp");
        %>
    </body>
</html>
