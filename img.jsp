<%-- 
    Document   : img
    Created on : 25 Jan, 2022, 9:01:24 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.InputStream" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
                String pid = (String)request.getParameter("imgid");
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                String sql = null;
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DRS","root", "");
                Statement st = con.createStatement();
                sql = "select Image from costume where P_id='"+pid+"'";
                rs = st.executeQuery(sql);
                String imgLen = "";
                while(rs.next())
                {
                    imgLen = rs.getString(1);
                    int len = imgLen.length();
                    byte[] rb = new byte[len];
                    InputStream readImg = rs.getBinaryStream(1);
                    int index = readImg.read(rb,0,len);
                    response.reset();
                    response.setContentType("image/jpg");
                    response.getOutputStream().write(rb,0,len);
                    response.getOutputStream().flush();
                }
                st.close();
                //response.getContentType();
            }
            catch(Exception e)
            {
                out.println("Error "+e);
            }
        %>
    </body>
</html>
