<%-- 
    Document   : forget
    Created on : 21 Oct, 2022, 10:32:25 PM
    Author     : hp
--%>

<%@page import="java.util.*,javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection conn=null;
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/DRS", "root", "");
            Statement p = conn.createStatement();
            Statement p1 = conn.createStatement();
                            
            String email = request.getParameter("email");
            String upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            String lower = "abcdefghijklmnopqrstuvwxyz";
            String num = "0123456789";
            String specialchars = "*$^%$@!#";
            String combination = upper+lower+specialchars+num;
            int length = 6;
            String password = "";
            Random r = new Random();
            for(int i=0;i<6;i++)
            {
                String pass = Character.toString(combination.charAt(r.nextInt(combination.length())));
                password = password+pass;
            }
            
            ResultSet rs1 = p1.executeQuery("select * from user where Email='"+email+"'");
            while(rs1.next())
                               {
                           
            String result;
             String to = email;
             final String from = "pg9165255@gmail.com";
             final String pswd = "Pgupta9165";
            String host = "smtp.gmail.com";
            Properties props = new Properties();
            props.put("mail.smtp.host", host);
            props.put("mail.transport.protocol", "smtp");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.user", from);
            props.put("mail.password", pswd);
            props.put("mail.port", "587");
            
            Session mailSession = Session.getInstance(props, new javax.mail.Authenticator(){
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(from,pswd);
                }
            });
                      try{
                MimeMessage message = new MimeMessage(mailSession);
                message.setFrom(new InternetAddress(from));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("Forgot Password");
                message.setText("Your! new password of shopee is : "+password);
                Transport.send(message);
                response.sendRedirect("Login.html");
            } catch(MessagingException mex){
                mex.printStackTrace();
                result = "Error : unable to send mail......"+mex.toString();
                               }
                                }
        %>
    </body>
</html>
