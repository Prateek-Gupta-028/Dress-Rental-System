<%-- 
    Document   : product
    Created on : 21 Oct, 2022, 1:15:13 PM
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
            String pname = request.getParameter("pname");
            String size = request.getParameter("size");
            String category = request.getParameter("category");
            String class2 = request.getParameter("class");
            String items = request.getParameter("items");
            String price = request.getParameter("price");
            String fee = request.getParameter("fee");
            String amount = request.getParameter("amount");
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(c,"root", "");
                InputStream inputStream = null;
                Part filePart = request.getPart("image");
                if(filePart!=null)
                {
                    
                    
                    inputStream = filePart.getInputStream();
                    String sql = "Insert into costume(P_id,Name,Category,Class,Image,No_items,Size,Price,fee,Amount)"
                            +" values(?,?,?,?,?,?,?,?,?,?)";
                    PreparedStatement p1 = connection.prepareStatement(sql);
                    p1.setString(1, pid);
                    p1.setString(2, pname);
                    p1.setString(3, category);
                    p1.setString(4, class2);
                    p1.setBlob(5, inputStream);
                    p1.setString(6, items);
                    p1.setString(7, size);
                    p1.setString(8, price);
                    p1.setString(9, fee);
                    p1.setString(10, amount);
                    
                    int row = p1.executeUpdate();
                    out.print(row);
                    if(row>0)
                    {
                        %>
                        <script>
                            alert("Product Registered Successfull");
                            window.location.href="Product.html";
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
