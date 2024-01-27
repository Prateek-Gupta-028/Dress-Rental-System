<%-- 
    Document   : add-to-cart
    Created on : 20 Oct, 2022, 4:46:50 PM
    Author     : hp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*" import="javax.servlet.http.*"%>
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
            String pid = request.getParameter("pid");
            String pname = request.getParameter("name");
            String category = request.getParameter("category");
            String amount = request.getParameter("amount");
            String price = request.getParameter("price");
            String fee = request.getParameter("fee");
            String email = (String)session.getAttribute("email");
            String phone = (String)session.getAttribute("phone");
            String uname = (String)session.getAttribute("uname");
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(c,"root", "");
                InputStream inputStream = null;
                Part filePart = request.getPart("photo");
                if(filePart!=null)
                {
                    inputStream = filePart.getInputStream();
                                                        
                    String sql = "Insert into cart(user_name,email,p_id,p_name,category,amount,price,fee,image)"
                            + "  values(?,?,?,?,?,?,?,?,?)";
                    PreparedStatement p1 = connection.prepareStatement(sql);
                    p1.setString(1, uname);
                    p1.setString(2, email);
                    p1.setString(3, pid);
                    p1.setString(4, pname);
                    p1.setString(5, category);
                    p1.setString(6, amount);
                    p1.setString(7, price);
                    p1.setString(8, fee);
                    p1.setBlob(9, inputStream);
                     
                    int row = p1.executeUpdate();
                    if(row>0)
                    {
                        %>
                        <script>
                            window.location.href="cart.jsp";
                        </script>
                        <%
                        }
                   }
            }
            catch(SQLException e)
            {
                //e.printStackTrace();
                out.print(e.toString());
            }
        %>
    </body>
</html>
