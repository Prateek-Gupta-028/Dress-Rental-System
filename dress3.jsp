<%-- 
    Document   : dress3
    Created on : 5 Nov, 2022, 4:26:12 PM
    Author     : hp
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

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
               
            String c = "jdbc:mysql://localhost:3306/DRS";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = null;
            con = DriverManager.getConnection(c, "root", "");
            Statement st = con.createStatement();
            Statement st2 = con.createStatement();
            String pid = request.getParameter("pid");
            String name = "";
            String image = "";
            int price;
            int fee;
            int amount;
            String size = "";
            String gender = "";
            String category = "";
            int items;
            ResultSet rs = st.executeQuery("Select * from costume where P_id= '"+pid+"'");
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
                            <li><a href="home.jsp">Home</a></li>
                            <li><a href="shop3.jsp">Shop</a></li>
                            <li><a href="#">View</a>
                                <ul class="dropdown">
                                    <li><a href="viewcontact2.jsp">Contacts</a></li>
                                    <li><a href="viewbooking2.jsp">Order</a></li>
                                    <li><a href="viewuser2.jsp">User</a></li>
                                </ul>
                            </li>
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

    <!-- Shop Details Section Begin -->
    <section class="shop-details">
        <div class="product__details__pic">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__breadcrumb">
                            <a href="home2.html">Home</a>
                            <a href="shop.jsp">Shop</a>
                            <span>Product Details</span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-9">
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <img src="img.jsp?imgid=<%=pid%>" height="400px" width="272px">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="product__details__content">
            <% 
                while(rs.next())
                {
                    name = rs.getString("Name");
                    price = rs.getInt("Price");
                    fee = rs.getInt("Fee");
                    amount = rs.getInt("Amount");
                    category = rs.getString("Class");
                    gender = rs.getString("Category");
                    items = Integer.parseInt(rs.getString("No_items"));
            %>
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <div class="product__details__text">
                            <h4><%=name%></h4>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                                <span> - 5 Reviews</span>
                            </div>
                            <h3><%=amount%><span>70.00</span></h3>
                            <p>Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable
                                cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening
                            with placket.</p>
                            <div class="product__details__option">
                                <div class="product__details__option__size">
                                    <span>Size:</span>
                                    <label for="xxl">xxl
                                        <input type="radio" id="xxl">
                                    </label>
                                    <label class="active" for="xl">xl
                                        <input type="radio" id="xl">
                                    </label>
                                    <label for="l">l
                                        <input type="radio" id="l">
                                    </label>
                                    <label for="sm">s
                                        <input type="radio" id="sm">
                                    </label>
                                </div>
                                <div class="product__details__option__color">
                                    <span>Color:</span>
                                    <label class="c-1" for="sp-1">
                                        <input type="radio" id="sp-1">
                                    </label>
                                    <label class="c-2" for="sp-2">
                                        <input type="radio" id="sp-2">
                                    </label>
                                    <label class="c-3" for="sp-3">
                                        <input type="radio" id="sp-3">
                                    </label>
                                    <label class="c-4" for="sp-4">
                                        <input type="radio" id="sp-4">
                                    </label>
                                    <label class="c-9" for="sp-9">
                                        <input type="radio" id="sp-9">
                                    </label>
                                </div>
                            </div>
                            <form method="post" action="add-to-cart.jsp" enctype="multipart/form-data">
                            <div class="product__details__cart__option">
                               <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
                                </div>
                                    <input type="hidden" name="name" value="<%=name%>">
                                    <input type="hidden" name="pid" value="<%=pid%>">
                                    <input type="hidden" name="category" value="<%=category%>">
                                    <input type="hidden" name="amount" value="<%=amount%>">
                                    <input type="hidden" name="price" value="<%=price%>">
                                    <input type="hidden" name="fee" value="<%=fee%>">
                                    <input type="hidden" name="photo" value="<%=rs.getBlob("Image")%>">
                                    <input class="primary-btn" type="submit"  value="add to cart">
                                </div>
                            </form>
                            <form method="post" action="book.jsp" enctype="multipart/form-data">
                            <div>
                                    <input type="hidden" name="name" value="<%=name%>">
                                    <input type="hidden" name="pid" value="<%=pid%>">
                                    <input type="hidden" name="category" value="<%=category%>">
                                    <input type="hidden" name="price" value="<%=price%>">
                                    <input type="hidden" name="fee" value="<%=fee%>">
                                    <input type="hidden" name="amount" value="<%=amount%>">
                                    <input type="hidden" name="items" value="<%=items%>">
                                    <input type="hidden" name="photo" value="<%=rs.getBlob("Image")%>">
                                    <input class="primary-btn" type="submit"  value="Book">
                            </div>
                            </form>
                            <div class="product__details__last__option">
                                <h5><span>Guaranteed Safe Checkout</span></h5>
                                <img src="img/shop-details/details-payment.png" alt="">
                                <ul>
                                    <li><span>Product ID : </span> <%=pid%></li>
                                    <li><span>Categories:</span> Clothes</li>
                                    <li><span>Tag:</span> Clothes, Skin, Body</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-5"
                                    role="tab">Description</a>
                                </li>
                           </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-5" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <p class="note">Your favorite suit got more graceful with a flared bottom! Suites 
                                            are the talk of the town - giving ethnic wear a new - age feel. A swish pick for 
                                            the social hour, these suits allow easy movements too - just the right combination 
                                            for deserving a spot in your closet!.</p>
                                        <div class="product__details__tab__content__item">
                                            <h5>Products Infomation</h5>
                                            <p>Traditional dress may be defined as the ensembles of garments, jewellary 
                                                and acceesories rooted in the past that is worn by an indentifiable group of peoples. 
                                                Though slight changes over time in color, form and material are acknowledged, the 
                                                assemblage seems to be handed down unchanged from the past. Traditional dress 
                                                or costume is a phrase used widely both by the general public and writers on dress. 
                                                It conjures up images of rural people dressed in colorful.</p>
                                        </div>
                                     </div>
                                </div>
                             </div>
                        </div>
                    </div>
                </div>
            </div>
            <% 
                   }
        %>
        </div>
        
    </section>
    <!-- Shop Details Section End -->

    <!-- Related Section Begin -->
    <% 
        ResultSet rs2 = st2.executeQuery("Select * from costume where Category= '"+gender+"' limit 4");
    %>
    <section class="related spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="related-title">Related Product</h3>
                </div>
            </div>
            <div class="row">
        <%   while(rs2.next()){ %>
                <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                            <img src="img.jsp?imgid=<%=rs2.getString("P_id")%>" height="260px" width="260px">
                                <ul class="product__hover">
                                <li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><%=rs2.getString("Name")%></h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5><%=rs2.getString("Amount")%></h5>
                            <div class="product__color__select">
                                        <form method="post" action="dress.jsp">
                                            <input type="hidden" name="pid" value="<%=rs2.getString("P_id")%>">
                                            <input id="product_order" type="submit" value="Order">
                                        </form>
                            </div>
                        </div>
                    </div>
                </div>
        <% 
                               }
        %>
            </div>
        </div>
    </section>
    <!-- Related Section End -->

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

    <!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search End -->

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
