<%-- 
    Document   : returncostume
    Created on : 28 Oct, 2022, 6:16:11 PM
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
        <style>
            .special{
                height: 50px;
                width:500px;
                font-size: 24px;
                background-color: peachpuff;
                color: black;
                font-weight: bold;
            }
            .special input(type==text){
                height: 40px;
                width: 310px;
                font-size: 24px;
            }
        </style>
        <script>
            function funct(d)
            {
                alert(d);
                var id = d;//document.form1.email.value;
                window.location.replace("returncostume.jsp?email1="+id);
            }
        
            window.history.forward(1);
            function noBack()
            {
                window.history.forward();
            }
    </script>
</head>

<body onload="noBack();" onpageshow="if(event.presisted) noBack();">
    
    <%
        if(session.getAttribute("id")==null || session.getAttribute("id").equals(""))
        {
            response.sendRedirect("admin.jsp");
        }
        response.setHeader("Cache-Control","no-cache");//HTTP 1.1
        response.setHeader("Pragma","no-cache");//HTTP 1.0
        response.setDateHeader("Expires",0);
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Cache-Control", "must-revalidate");
        %>
        <!-- Page Preloder -->
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
                            <li><a href="home3.jsp">Home</a></li>
                            <li><a href="shop2.jsp">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="dropdown">
                                    <li><a href="Product.html">Add Product</a></li>
                                    <li><a href="3">Return Order</a></li>
                                </ul>
                            </li><li><a href="#">View</a>
                                <ul class="dropdown">
                                    <li><a href="viewcontact.jsp">Contacts</a></li>
                                    <li><a href="vieworder.jsp">Order</a></li>
                                    <li><a href="viewcostume.jsp">Products</a></li>
                                    <li><a href="viewreturn.jsp">Returned</a></li>
                                    <li><a href="viewuser.jsp">User</a></li>
                                    <li><a href="waiting.jsp">Waiting</a></li>
                                    
                                </ul>
                            </li>
                            <li><a href="about2.html">About Us</a></li>
                            
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__menu mobile-menu">
                        <ul>
                            <li class="sign">
                                <a href="logout2.jsp">Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->
        
        <form name="form1" method="post" action="returncostume.jsp">
        <center><table border="1px solid black" class="special">
            <tr>
                <td>Enter Email : </td>
                <td><input type="text" name="email" placeholder="Enter email" required onblur="funct(this.value)"></td>
                <td><input type="submit" value="submit"></td>
            </tr>
        </table></center>
        </form>
        <%
            String ccd="";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/DRS", "root", "");
            Statement st1 = con1.createStatement();
            String a = "";
            String b = "";
            String c = "";
            try{
                String id = request.getParameter("email1");
               
                
                ResultSet rst1 = st1.executeQuery("select * from order1 where email='"+id+"'");
                %>
                
                <section class="shopping-cart spad">
                <div class="container">
                    
                    <div class="row">
                        <div class="col-lg-8">
                        <div class="shopping__cart__table">  
                        
                        <table>
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                                while(rst1.next())
                            { %>
                            
                           <form method="post" action="return.jsp">
                        <input type="hidden" name="pid" value="<%=rst1.getString("pid")%>">
                        <input type="hidden" name="uname" value="<%=rst1.getString("username")%>">
                        <input type="hidden" name="email" value="<%=id%>">
                        <input type="hidden" name="pname" value="<%=rst1.getString("pname")%>">
                        <input type="hidden" name="amount" value="<%=rst1.getString("amount")%>">
                                <tr>
                                    <td class="product__cart__item">
                                        <div class="product__cart__item__pic">
                                            <img src="img.jsp?imgid=<%=rst1.getString("pid")%>" height="90px" width="90px">
                                        </div>
                                        <div class="product__cart__item__text">
                                            <h6><%=rst1.getString("pname")%></h6>
                                            <h5><%=rst1.getString("amount")%></h5>
                                        </div>
                                    </td>
                                    <td class="quantity__item">
                                        <div class="quantity">
                                            <div class="pro-qty-2">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="cart__price"><%=rst1.getString("price")%></td>
                                    
                                    <td class="cart__close"><input type="submit" value="Returned"></td>
                                </tr>
                                </form>
                               <% } %>
                            </tbody>
                        </table>
                    
                    </div>
                 </div>
            </div>
  
        </div>
    </section>
            <% }

            catch(Exception e1)
            {
                e1.printStackTrace();
            }
        %>
        
        
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
