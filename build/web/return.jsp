<%-- 
    Document   : return
    Created on : 29 Oct, 2022, 9:47:38 PM
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
            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            String d1 = formatter.format(date); 
        
            String pid = request.getParameter("pid");
            String pname = request.getParameter("pname");
            String email = request.getParameter("email");
            String amount = request.getParameter("amount");
            String uname = request.getParameter("uname");
            int items = 0;
            String item = "";
            String e = "";
            try
            {
            Connection connection = null;
            String c = "jdbc:mysql://localhost:3306/DRS";
            Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(c,"root", "");     
                
                Statement q1 = connection.createStatement();
                ResultSet rs = q1.executeQuery("select * from costume where P_id='"+pid+"'");
                while(rs.next())
                                       {
                    items = Integer.parseInt(rs.getString("No_items"));
                    
                }
                
                Statement q2 = connection.createStatement();
                ResultSet rs2 = q2.executeQuery("select * from order1 where pid='"+pid+"' and status='waiting' limit 1");
                if(rs.next()){
                    e = rs2.getString("email");
                    String sql4 = "Update order1 set status='Confirmed' where pid ='"+pid+"' and email='"+e+"'";
                    PreparedStatement p4 = connection.prepareStatement(sql4);
                    int r4 = p4.executeUpdate();
                }
                else{
                    String sql3 = "Update costume set No_items=? where P_id ='"+pid+"'";
                    PreparedStatement p3 = connection.prepareStatement(sql3);
                    items++;
                    item = Integer.toString(items);
                     p3.setString(1, item);
                     int r3 = p3.executeUpdate();
                }
              
                String sql = "Insert into return1(username,email,pid,pname,amount,date)"
                            + " values(?,?,?,?,?,?)";
                String sql2 = "Delete from order1 where email='"+email+"' and pid='"+pid+"'";
                
                    PreparedStatement p1 = connection.prepareStatement(sql);
                    PreparedStatement p2 = connection.prepareStatement(sql2);
                    p1.setString(1, uname);
                    p1.setString(2, email);
                    p1.setString(3, pid);
                    p1.setString(4, pname);
                    p1.setString(5, amount);
                    p1.setString(6, d1);
                   
                    int row = p1.executeUpdate();
                    int r2 = p2.executeUpdate();
                    if(row>0)
                    {
                        %>
                        <script>
                            alert("Order Returned successfully");
                            window.location.href="returncostume.jsp";
                        </script>
                        <%
                    }
                    else{
                        %>
                        <script>
                            alert("Something is wrong");
                            window.location.href="returncostume.jsp";
                        </script>
                   <% }
            }
            catch(SQLException q)
            {
                //q.printStackTrace();
                out.print(q.toString());
            }
        %>
    </body>
</html>



