<%-- 
    Document   : book
    Created on : 20 Oct, 2022, 8:26:30 PM
    Author     : hp
--%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*" import="javax.servlet.http.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date" %>
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
            
            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            String d1 = formatter.format(date); 
           
            
            String pid = request.getParameter("pid");
            String pname = request.getParameter("name");
            String category = request.getParameter("category");
            String price = request.getParameter("price");
            String fee = request.getParameter("fee");
            String amount = request.getParameter("amount");
            int items = Integer.parseInt(request.getParameter("items"));
            String status = "";
            String uname = (String)session.getAttribute("uname");
            String email = (String)session.getAttribute("email");
            String phone = (String)session.getAttribute("phone");
            
            if(items>0){
                status = "Confirmed";
                items--;
            }
                       else {
                        status = "Waiting";
                       }
            String item = Integer.toString(items);
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(c,"root", "");
                InputStream inputStream = null;
                Part filePart = request.getPart("photo");
                if(filePart!=null)
                {                  
                    inputStream = filePart.getInputStream();
                String sql = "Insert into order1(username,email,pid,pname,category,price,fee,amount,status,image,date)"
                            + " values(?,?,?,?,?,?,?,?,?,?,?)";
                String sql2 = "Update costume set No_items=? where P_id ='"+pid+"'";
                    PreparedStatement p1 = connection.prepareStatement(sql);
                    PreparedStatement p2 = connection.prepareStatement(sql2);
                    p1.setString(1, uname);
                    p1.setString(2, email);
                    p1.setString(3, pid);
                    p1.setString(4, pname);
                    p1.setString(5, category);
                    p1.setString(6, price);
                    p1.setString(7, fee);
                    p1.setString(8, amount);
                    p1.setString(9, status);
                    p1.setBlob(10, inputStream);
                    p1.setString(11, d1);
                    p2.setString(1, item);
                    int row = p1.executeUpdate();
                    int r2 = p2.executeUpdate();
                    if(row>0)
                    {
                        %>
                        <script>
                            alert("Order Booked successfully");
                            window.location.href="myorder.jsp";
                        </script>
                        <%
                    }
                    else{
                        %>
                        <script>
                            alert("Something Wrong");
                            window.location.href="home2.jsp";
                        </script>
                   <% }
                }
            }
            catch(SQLException q)
            {
                //q.printStackTrace();
                out.print(q.toString());
            }
        %>
    </body>
</html>



