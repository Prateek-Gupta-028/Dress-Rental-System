<%-- 
    Document   : admin
    Created on : 30 Oct, 2022, 6:27:20 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>DRS| Login</title>
<link href="Login_1.css" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Play" rel="stylesheet">
<script>
            window.history.backward();
</script>
</head>

<body>
    <%
            if(session.getAttribute("id")!=null)
            {
                response.sendRedirect("home3.jsp");
            }
        %>
    <header class="header">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="logo">
                   <a href="#">Shopify</a>
                </div>
                <button type="button" class="nav-toggler">
                   <span></span>
                </button>
                <nav class="nav">
                   <ul>
                      <li><a href="index.html" >Home</a></li>
                      <li><a href="basicshop.jsp">Shop</a></li>
                      <li><a href="about.html">About Us</a></li>
                      <li><a href="contact.html">Contacts</a></li>
                      <li><a href="#" class="active">Admin</a></li>
                   </ul>
                </nav>
            </div>
        </div>
     </header>
    <script src="script.js"></script>
   <div class="signin">
<form method="post" action="check2.jsp">
<h2 style="color:#fff;">Log In</h2>
<input type="text" name="username" placeholder="Username"/><br /><br />
<input type="password" name="password" placeholder="Password" /><br /><br />
<select name="type" class="sel">
                    <option value="#">Select As</option>
                    <option value="admin">Admin</option>
                    <option value="manager">Manager</option>
                </select><br /><br/>
<input type="submit" value="Log In" /><br /><br />
</form>
       <div id="container"><center>
<a href="Reset.html" style=" margin-right:0px; font-size:16px; font-family:Tahoma, Geneva, sans-serif;">Reset password?</a>
    </center></div><br /><br />
</div>
</body>
</html>
