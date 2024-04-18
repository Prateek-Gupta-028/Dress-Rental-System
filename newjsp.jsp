<%-- 
    Document   : newjsp
    Created on : 29 Oct, 2022, 9:59:08 PM
    Author     : hp
--%>

<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*" import="javax.servlet.http.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        String item = "";
        String pid = request.getParameter("pid");
                out.print(pid);
            out.print(request.getParameter("pname"));
            out.print(request.getParameter("email"));
            out.print(request.getParameter("amount"));
            out.print(request.getParameter("uname"));
                Connection connection = null;
                String c = "jdbc:mysql://localhost:3306/DRS";
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(c,"root", "");     
                Statement p = connection.createStatement();
                ResultSet rs = p.executeQuery("select * from costume where P_id='"+pid+"'");
                if(rs.next())
                                       {
                   out.print(rs.getString("No_items"));
                  
                }
         %>
    </body>
</html>
