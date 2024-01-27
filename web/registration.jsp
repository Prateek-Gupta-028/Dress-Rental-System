<%-- 
    Document   : registration
    Created on : 20 Oct, 2022, 9:14:44 PM
    Author     : hp
--%>

<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*" import="javax.servlet.http.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection connection = null;
            String c = "jdbc:mysql://localhost:3306/DRS";
            
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(c,"root", "");
                
                    String sql = "Insert into user(name,email,phone,password,address)"
                            + "  values(?,?,?,?,?)";
                    PreparedStatement p1 = connection.prepareStatement(sql);
                    p1.setString(1, name);
                    p1.setString(2, email);
                    p1.setString(3, phone);
                    p1.setString(4, password);
                    p1.setString(5, address);
                    
                    int row = p1.executeUpdate();
                    if(row>0)
                    {
                        %>
                        <script>
                            alert("Registration successfull");
                            window.location.href="Register.html";
                        </script>
                        <%
                    }
                    else{
                        %>
                        <script>
                            alert("You! Already Registered");
                            window.location.href="Register.html";
                        </script>
                   <% }
            }
            catch(SQLException q)
            {
                q.printStackTrace();
                //out.print(e.toString());
            }
        %>
    </body>
</html>


