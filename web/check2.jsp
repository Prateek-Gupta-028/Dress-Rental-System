<%-- 
    Document   : check2
    Created on : 30 Oct, 2022, 6:42:02 PM
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
            try{
                String user = request.getParameter("username");
                String pass = request.getParameter("password");
                String type = request.getParameter("type");
         
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DRS", "root", "");
                Statement st = conn.createStatement();
                //if(type.equals("user")
                ResultSet rs = null;
                if(type.equals("manager")){
                 rs = st.executeQuery("select * from manager where id = '"+user+"' and password = '"+pass+"'");
                }
                               else{
                    rs = st.executeQuery("select * from admin where admin_id = '"+user+"' and password = '"+pass+"'");
                               }
                if(rs.next())
                {
                    session.setAttribute("id", user);
                    if(type.equals("manager")){
                    response.sendRedirect("home3.jsp");
                    } 
                    if(type.equals("admin")){
                        response.sendRedirect("home.jsp");
                    }
                }
                else
                {
                    %>
                    <script>
                        alert("Invalid Login Please Try Again!");
                        window.location = "admin.jsp";
                    </script>
                <% }
            }
            catch(Exception e)
            {
                out.print("<h1>Something is wrong......</h1>");
                out.print(e.toString());
            }
        %>
    </body>
</html>
