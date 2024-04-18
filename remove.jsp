<%-- 
    Document   : remove
    Created on : 27 Oct, 2022, 4:44:13 PM
    Author     : hp
--%>


<%-- 
    Document   : Delete
    Created on : 2 Feb, 2022, 8:30:59 PM
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
        String email1 = request.getParameter("email");
        String pid = request.getParameter("pid");
        try{
            Connection con = null;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DRS", "root", "");
            PreparedStatement p1 = null;
            String sql = null;
            sql = "Delete from cart where email=? and p_id=?";
            p1 = con.prepareStatement(sql);
            p1.setString(1,email1);
            p1.setString(2, pid);
            int y = p1.executeUpdate();
            
            if(y==1)
            {
                out.print("Record Deleted");
                %>
                <script>
                            window.location.href="cart.jsp";
                </script>
       <% }
            else
            {
                out.print("Record not Found");
            }
        }
        catch(Exception e1)
                               {
            //e1.printStackTrace();
            out.print(e1.toString());
        }
        %>
        </body>
</html>
