<%-- 
    Document   : check
    Created on : 20 Oct, 2022, 9:24:36 PM
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
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DRS", "root", "");
                Statement st = conn.createStatement();
                String name = "";
                String phone = "";
                ResultSet rs = null;
                rs = st.executeQuery("select * from user where Email = '"+user+"' and Password = '"+pass+"'");
               if(rs.next())
                {
                    name = rs.getString("Name");
                    phone = rs.getString("Phone");
                    session.setAttribute("email", user);
                    session.setAttribute("uname", name);
                    session.setAttribute("phone", phone);
                    response.sendRedirect("home2.jsp");
                }
                else
                {
                    %>
                    <script>
                        alert("Invalid Login Please Try Again!");
                        window.location = "login.jsp";
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

