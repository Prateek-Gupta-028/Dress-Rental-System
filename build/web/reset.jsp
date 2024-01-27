<%-- 
    Document   : reset
    Created on : 21 Oct, 2022, 9:47:58 PM
    Author     : hp
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String USER = request.getParameter("username");
            String OLD = request.getParameter("oldPassword");
            String NEW = request.getParameter("newPassword");
            String CON = request.getParameter("conPassword");
            try{
                Connection conn = null;
                Class.forName("com.mysql.jdbc.Driver");
                String jdbcURL = "jdbc:mysql://localhost:3306/DRS";
                conn = DriverManager.getConnection(jdbcURL, "root", "");
                PreparedStatement p = null;
                ResultSet rs = null;
                String sql = null;
                sql = "select * from user where Email = '"+USER+"' and Password='"+OLD+"'";
                p = conn.prepareStatement(sql);
                rs = p.executeQuery();
                if(rs.next())
                {
                    int i = p.executeUpdate("update user set Password='"+NEW+"' where Email='"+USER+"'");
                    out.println("<script>alert('Password changed');</script>");
                    out.println("<script>window.open('Login.html','_self');</script>");
                }
                else{
                    out.println("<script>alert('Please enter correct old password');</script>");
                    out.println("<script>window.open('Reset.html','_self');</script>");
                }
            }
            catch(Exception e)
                                       {
                out.println(e);
            }
        %>
    </body>
</html>
