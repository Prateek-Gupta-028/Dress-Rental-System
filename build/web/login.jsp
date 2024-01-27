<%-- 
    Document   : login
    Created on : 30 Oct, 2022, 3:36:35 PM
    Author     : hp
--%>

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
            if(session.getAttribute("email")!=null)
            {
                response.sendRedirect("home2.jsp");
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
                      <li><a href="admin.jsp">Admin</a></li>
                      <li><a href="#" class="active">Login</a></li>
                   </ul>
                </nav>
            </div>
        </div>
     </header>
    <script src="script.js"></script>
   <div class="signin">
<form method="post" action="check.jsp">
<h2 style="color:#fff;">Log In</h2>
<input type="text" name="username" placeholder="Username"/><br /><br />
<input type="password" name="password" placeholder="Password" /><br /><br />
<input type="submit" value="Log In" /><br /><br />
</form>
<div id="container"><center>
<a href="Reset.html" style=" margin-right:0px; font-size:16px; font-family:Tahoma, Geneva, sans-serif;">Reset password?</a>
    </center></div><br /><br />
Don't have account?<a href="Register.html" style="font-family:'Play', sans-serif;">&nbsp;Register </a>
</div>
</body>
</html>
