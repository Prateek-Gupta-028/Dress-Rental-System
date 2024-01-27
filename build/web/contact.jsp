<%-- 
    Document   : contact
    Created on : 21 Oct, 2022, 12:13:32 PM
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
            String subject = request.getParameter("subject");
            String message = request.getParameter("message");
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(c,"root", "");
                
                    String sql = "Insert into contact(name,email,phone,subject,message)"
                            + "  values(?,?,?,?,?)";
                    PreparedStatement p1 = connection.prepareStatement(sql);
                    p1.setString(1, name);
                    p1.setString(2, email);
                    p1.setString(3, phone);
                    p1.setString(4, subject);
                    p1.setString(5, message);
                    
                    int row = p1.executeUpdate();
                    if(row>0)
                    {
                        %>
                        <script>
                            alert("Your message has send successfull.");
                            window.location.href="contact.html";
                        </script>
                        <%
                    }
                    else{
                        %>
                        <script>
                            alert("Sorry! Unable to Send");
                            window.location.href="contact.html";
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


