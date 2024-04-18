<%-- 
    Document   : viewcostume
    Created on : 27 Oct, 2022, 5:45:17 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DRS</title>
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
            .a{
                background-color: black;
                color: white;
                font-family: fantasy;
                font-size: 28px;
                text-align: center;
            }
            tr{
                text-align: center;
                font-size: 20px;
                margin-bottom: 0px;
                text-decoration: none;
            }
            a{
                font-size: 25px;
            }
        </style>
    <script>
            window.history.forward(1);
            function noBack()
            {
                window.history.forward();
            }
    </script>
</head>

<body  style="background-color:teal;" onload="noBack();" onpageshow="if(event.presisted) noBack();">
    
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
        
        
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DRS","root","");
            Statement p = conn.createStatement();
            ResultSet rs = p.executeQuery("select * from costume");
        %>
         
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
                                    <li><a href="returncostume.jsp">Return Order</a></li>
                                </ul>
                            </li><li><a href="#">View</a>
                                <ul class="dropdown">
                                    <li><a href="viewcontact.jsp">Contacts</a></li>
                                    <li><a href="vieworder.jsp">Order</a></li>
                                    <li><a href="#">Products</a></li>
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
        
        <table border="1" align="center" cellspacing="5"  width="80%" style="margin-top:20px;">
            <tr class="a">
                <td>P_id</td>
                <td>Name</td>
                <td>Category</td>
                <td>Class</td>
                <td>Price</td>
                <td>Amount</td>
                <td>Edit</td>
            </tr>
            <%
                int cnt=2;
                while(rs.next())
                {
                    if(cnt%2==0)
                    {
            %>
            <tr bgcolor="lightsteelblue">
            <form method="post" action="editcostume.jsp">
                <input type="hidden" name="pid" value="<%=rs.getString("P_id")%>"> 
                        <td><%=rs.getString("P_id")%></td>
                        <td><%=rs.getString("Name")%></td>
                        <td><%=rs.getString("Category")%></td>
                        <td><%=rs.getString("Class")%></td>
                        <td><%=rs.getString("Price")%></td>
                        <td><%=rs.getString("Amount")%></td>
                        <td><input  type="submit" value="Edit"></td>
            </form>
                </tr>
                <% }
                else
                { %>
                    <tr bgcolor="khaki">
                        <form method="post" action="editcostume.jsp">
                <input type="hidden" name="pid" value="<%=rs.getString("P_id")%>"> 
                        <td><%=rs.getString("P_id")%></td>
                        <td><%=rs.getString("Name")%></td>
                        <td><%=rs.getString("Category")%></td>
                        <td><%=rs.getString("Class")%></td>
                        <td><%=rs.getString("Price")%></td>
                        <td><%=rs.getString("Amount")%></td>
                        <td><input  type="submit" value="Edit"></td>
            </form>
                    </tr>
                
            <%
                }
            cnt++;
                }
            %>
        </table>
        
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

