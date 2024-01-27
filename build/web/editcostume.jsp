<%-- 
    Document   : editcostume
    Created on : 28 Oct, 2022, 6:05:54 PM
    Author     : hp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
        rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="Product.css">
</head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
        <!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li class="active"><a href="#">Home</a></li>
                            <li><a href="shop.jsp">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="dropdown">
                                    <li><a href="Product.html">Add Product</a></li>
                                    <li><a href="returncostume.jsp">Return Order</a></li>
                                </ul>
                            </li><li><a href="#">View</a>
                                <ul class="dropdown">
                                    <li><a href="viewcontact.jsp">Contacts</a></li>
                                    <li><a href="vieworder.jsp">Order</a></li>
                                    <li><a href="viewcostume.jsp">Products</a></li>
                                    <li><a href="viewreturned.jsp">Returned</a></li>
                                    <li><a href="viewuser.jsp">User</a></li>
                                    <li><a href="waiting.jsp">Waiting</a></li>
                                    
                                </ul>
                            </li>
                            <li><a href="aboutus.html">About Us</a></li>
                            
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__menu mobile-menu">
                        <ul>
                            <li class="sign">
                                <a href="logout.jsp">Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    
    <%
            String pid = request.getParameter("pid");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DRS","root","");
            Statement p = conn.createStatement();
            ResultSet rs = p.executeQuery("select * from costume where P_id = '"+pid+"'");
        %>
    <center><div class="regform"><h1>Registration </h1></div></center>
    <div class="main">
        <%
             while(rs.next()){
         %>
        <form name="fileform" method="post" action="product2.jsp" enctype="multipart/form-data">
            
                <h3 class="number">Product Id</h3>
                <input type="text" name="pid" class="Name" value="<%=rs.getString("P_id")%>" required="Fill up">
            
            <h3 class="name">Name</h3>
            <input type="name" name="pname" class="Name" value="<%=rs.getString("Name")%>" required="Fill up">
            <h3 class="size">Size</h3>
            <input type="text" name="size" class="Size" value="<%=rs.getString("Size")%>" required="Fill up">
            <h2 class="category">Category</h2>
            <select name="category" class="Category" value="<%=rs.getString("Category")%>">
                <option>Select Option</option>
                <option>Men</option>
                <option>Women</option>
                <option>Kids</option>
            </select>
            <h2 class="class">Class</h2>
            <select name="class" class="Class" value="<%=rs.getString("Class")%>">
                <option>Select Option</option>
                <option value="Lehanga">Lehenga</option>
                <option>Garba Dress</option>
                <option>Gown</option>
                <option>Suit</option>
            </select>
           
            <h2 class="fees">Image</h2>
            <input name="image" type="file" class="Fees" placeholder="Image" required="Fill up">
            <h2 class="items"> No_Items</h2>
            <input name="items" type="number" class="Items" value="<%=rs.getString("No_items")%>" required="Fill up">
            <h2 class="price">Price</h2>
            <input name="price" type="number" class="Price" value="<%=rs.getString("Price")%>" required="Fill up">
            <h2 class="fees">Fees</h2>
            <input name="fee" type="number" class="Fees" value="<%=rs.getString("Fee")%>" required="Fill up">
            <h2 class="amount">Amount</h2>
            <input name="amount" type="number" class="Amount" value="<%=rs.getString("Amount")%>" required="Fill up">

            <input type="submit" class="btn" value="Register" name="">
        </form>
        <% } %>
    </div>
    
    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.nicescroll.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>