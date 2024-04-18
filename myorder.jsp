<%-- 
    Document   : myorder
    Created on : 30 Oct, 2022, 2:53:43 PM
    Author     : hp
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>DRS</title>

    <!-- Google Font -->
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
    <script>
            window.history.forward(1);
            function noBack()
            {
                window.history.forward();
            }
    </script>
</head>

<body onload="noBack();" onpageshow="if(event.presisted) noBack();">
    
    <%
        if(session.getAttribute("email")==null || session.getAttribute("email").equals(""))
        {
            response.sendRedirect("login.jsp");
        }
        response.setHeader("Cache-Control","no-cache");//HTTP 1.1
        response.setHeader("Pragma","no-cache");//HTTP 1.0
        response.setDateHeader("Expires",0);
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Cache-Control", "must-revalidate");
      
            String c = "jdbc:mysql://localhost:3306/DRS";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = null;
            con = DriverManager.getConnection(c, "root", "");
            Statement st = con.createStatement();
            String pname = "";
            String price = "";
            String fee = "";
            String amount = "";
            String pid = " ";
            String date = "";
            String email = (String)session.getAttribute("email");
            ResultSet rs = st.executeQuery("Select * from order1 where email = '"+email+"' order by date desc");
    %>
        
        <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
        <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                        <a href="./index.html"><img src="img/logo4.jpg" alt="" height="30"></a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a href="home2.jsp">Home</a></li>
                            <li><a href="shop.jsp">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="dropdown">
                                    <li class="active"><a href="#">My Orders</a></li>
                                    <li><a href="cart.jsp">Shopping Cart</a></li>
                                </ul>
                            </li>
                            <li><a href="aboutus.html">About Us</a></li>
                            <li><a href="contactus.html">Contacts</a></li>
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
    <!-- Header Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>My Orders</h4>
                        <div class="breadcrumb__links">
                            <a href="home2.html">Home</a>
                            <a href="shop.jsp">Shop</a>
                            <span>My Orders</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="shopping__cart__table">
                        
                        
                        <table>
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Status</th>
                                    <th>Total</th>
                                    <th>Date</th>
                                </tr>
                            </thead>
                            <tbody>
                    <%
                    while(rs.next()){
                        pname = rs.getString("pname");
                        price = rs.getString("price");
                        pid = (String)rs.getString("pid");
                        fee = rs.getString("fee");
                        amount = rs.getString("amount");
                        date = rs.getString("date");
                    %>
                                <tr>
                                    <td class="product__cart__item">
                                        <div class="product__cart__item__pic">
                                            <img src="img.jsp?imgid=<%=pid%>" height="90px" width="90px">
                                        </div>
                                        <div class="product__cart__item__text">
                                            <h6><%=pname%></h6>
                                            <h5><%=amount%></h5>
                                        </div>
                                    </td>
                                    <td class="quantity__item">
                                        <div class="quantity">
                                            <%=rs.getString("status")%>
                                        </div>
                                    </td>
                                    <td class="cart__price"><%=price%></td>
                                    
                                    <td class="cart__close"><%=date%></td>
                                </tr>
                    <% } %>
                            </tbody>
                        </table>
                    
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn update__btn">
                                <a href="shop.jsp"><i class="fa fa-spinner"></i>Continue Shopping</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__logo">
                            <a href="#"><img src="img/logo4.jpg" alt=""></a>
                        </div>
                        <p>The customer is at the heart of our unique business model, which includes design.</p>
                        <a href="#"><img src="img/payment.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
                    <div class="footer__widget">
                        <h6>Shopping</h6>
                        <ul>
                            <li><a href="shop.html">Clothing Store</a></li>
                            <li><a href="shop.html">Sale</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-6">
                    <div class="footer__widget">
                        <h6>Shopping</h6>
                        <ul>
                            <li><a href="contact.html">Contact Us</a></li>
                            <li><a href="#">Return & Exchanges</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
                    <div class="footer__widget">
                        <h6>NewLetter</h6>
                        <div class="footer__newslatter">
                            <p>Be the first to know about new arrivals, look books, sales & promos!</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="footer__copyright__text">
                        
                        <p>Copyright ©
                            <script>
                                document.write(new Date().getFullYear());
                            </script>2020
                            All rights reserved | 
                        </p>
                        
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->
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
