<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 23-Apr-17
  Time: 10:24 PM
  To change this template use File | Settings | File Templates.
--%>

<%@page import="java.sql.*"%>
<%@ page import="com.connections.OracleConn" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="com.sun.xml.internal.ws.util.StringUtils" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
         pageEncoding="US-ASCII"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Moderna - Bootstrap 3 flat corporate template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="http://bootstraptaste.com" />
    <!-- css -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
    <link href="css/jcarousel.css" rel="stylesheet" />
    <link href="css/flexslider.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />


    <!-- Theme skin -->
    <link href="skins/default.css" rel="stylesheet" />


</head>
<body>
<%
    //allow access only if session exists
    String user = (String) session.getAttribute("name");
    String userName = null;
    String sessionID = null;
    Cookie[] cookies = request.getCookies();
    if(cookies !=null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("name")) userName = cookie.getValue();
            if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
        }
    }
%>
<div id="wrapper">
    <!-- start header -->
    <header>
        <div class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="categorii.jsp"><span>C</span>ondr</a>
                </div>
                <div class="navbar-collapse collapse ">
                    <ul class="nav navbar-nav">
                        <li><div class="widget">
                            <form action="productSearch.jsp" class="form-search" method="post">
                                <input class="form-control" type="text"  name="nume_prod_de_la_user" value="" placeholder="Introdu un produs..">
                                <input type="submit" style="position: absolute; left: -9999px"/>
                            </form>
                        </div></li>
                        <li><a href="categorii.jsp">Home</a></li>
                        <li><a href="profil.jsp">Profil</a></li>
                        <li> <a href="CheckoutPage.jsp">Checkout Page</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <!-- end header -->

    <%

        OracleConn oracleConn3 = new OracleConn();
        Connection conn3 = oracleConn3.getConn();
        int idut_user_inceput1=0;
        String idut_user_inceput="";
        response.setContentType("text/html");
        Statement stmt4=null;
        if(conn3!=null)
            try {
                stmt4 = conn3.createStatement();

                ResultSet rs3 = stmt4.executeQuery(" select * from useri where email='"+userName+"'");
                while(rs3.next()) {
                    idut_user_inceput1 = rs3.getInt("userid");
                    idut_user_inceput = Integer.toString(idut_user_inceput1);
                    System.out.println("id la inceput: "+idut_user_inceput);
                }

            } catch(Exception ex){

            }
    %>

    <section id="content">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="post-heading">

                        <h3>Legume</h3> <!-- pot sa fac sa ia rezultate din bd, momentan hardcodez cu ce stiu ca am in bd-->
                        <form action="ingredientsAvoidServlet" method="post">
                        <input type="hidden" name="selectii" value="<%=idut_user_inceput%>">
                        <%
                            OracleConn oracleConn1 = new OracleConn();
                            Connection conn1 = oracleConn1.getConn();

                            response.setContentType("text/html");
                            Statement stmt2;
                            if(conn1!=null)
                            try {

                            stmt2 = conn1.createStatement();
                            ResultSet rs2 = stmt2.executeQuery("SELECT ingredientname from legume");
                            while(rs2.next()) {
                            String ingredient = rs2.getString("ingredientname");
                            out.println( "<input type=\"checkbox\" name=\"selectii\" value="+ingredient+">"+ StringUtils.capitalize(ingredient)+"<br>");
                            }


                            } catch(Exception ex){

                            }
                            %>

                        <%--<input type="checkbox" name="selectii" value="rosie">Rosie<br>--%>
                        <%--<input type="checkbox" name="selectii" value="castravete">Castravete<br>--%>
                        <%--<input type="checkbox" name="selectii" value="spanac">Spanac<br>--%>
                        <%--<input type="checkbox" name="selectii" value="varza">Varza<br>--%>
                        <%--<input type="checkbox" name="selectii" value="ardei">Ardei<br>--%>
                        <%--<input type="checkbox" name="selectii" value="vanata">Vanata<br>--%>
                        <%--<input type="checkbox" name="selectii" value="brocoli">Brocoli<br>--%>
                        <%--<input type="checkbox" name="selectii" value="ceapa">Ceapa<br>--%>
                        <%--<input type="checkbox" name="selectii" value="cartofi">Cartofi<br>--%>
                        <%--<input type="checkbox" name="selectii" value="morcovi">Morcovi<br>--%>
                        <%--<input type="checkbox" name="selectii" value="telina">Telina<br>--%>
                        <%--<input type="checkbox" name="selectii" value="ridiche">Ridiche<br>--%>
                        <%--<input type="checkbox" name="selectii" value="ardei iute">Ardei iute<br>--%>
                        <input type="submit" name="submit" value="Avoid">
                        </form>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="post-heading">
                        <h3>Fructe</h3>
                        <form action="ingredientsAvoidServlet" method="post">
                        <input type="hidden" name="selectii" value="<%=idut_user_inceput%>">

                            <%

                                response.setContentType("text/html");
                                Statement stmt3 ;
                                if(conn1!=null)
                                    try {

                                        stmt3 = conn1.createStatement();
                                        ResultSet rs2 = stmt3.executeQuery("SELECT ingredientname from Fructe");
                                        while(rs2.next()) {
                                            String ingredient = rs2.getString("ingredientname");
                                            out.println( "<input type=\"checkbox\" name=\"selectii\" value="+ingredient+">"+ StringUtils.capitalize(ingredient)+"<br>");
                                        }

                                    } catch(Exception ex){

                                    }
                            %>


                        <input type="submit" name="submit" value="Avoid">
                        </form>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="post-heading">
                        <h3>Produse Animale</h3>
                        <form action="ingredientsAvoidServlet" method="post">
                        <input type="hidden" name="selectii" value="<%=idut_user_inceput%>">

                            <%

                                response.setContentType("text/html");
                                Statement stmt1 ;
                                if(conn1!=null)
                                    try {

                                        stmt1 = conn1.createStatement();
                                        ResultSet rs2 = stmt1.executeQuery("SELECT ingredientname from produse_animale");
                                        while(rs2.next()) {
                                            String ingredient = rs2.getString("ingredientname");
                                            out.println( "<input type=\"checkbox\" name=\"selectii\" value="+ingredient+">"+ StringUtils.capitalize(ingredient)+"<br>");
                                        }

                                    } catch(Exception ex){

                                    }
                            %>


                        <input type="submit" name="submit" value="Avoid">
                        </form>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="post-heading">
                        <h3>Asezonari</h3>
                        <form action="ingredientsAvoidServlet" method="post">
                        <input type="hidden" name="selectii" value="<%=idut_user_inceput%>">
                            <%

                                response.setContentType("text/html");
                                Statement stmt5 ;
                                if(conn1!=null)
                                    try {

                                        stmt5 = conn1.createStatement();
                                        ResultSet rs2 = stmt5.executeQuery("SELECT ingredientname from Asezonari");
                                        while(rs2.next()) {
                                            String ingredient = rs2.getString("ingredientname");
                                            out.println( "<input type=\"checkbox\" name=\"selectii\" value="+ingredient+">"+ StringUtils.capitalize(ingredient)+"<br>");
                                        }

                                    } catch(Exception ex){

                                    }
                            %>


                        <input type="submit" name="submit" value="Avoid">
                        </form>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-3">
                    <div class="post-heading">
                        <h3>Lactate</h3>
                        <form action="ingredientsAvoidServlet" method="post">
                        <input type="hidden" name="selectii" value="<%=idut_user_inceput%>">
                            <%

                                response.setContentType("text/html");
                                Statement stmt6 ;
                                if(conn1!=null)
                                    try {

                                        stmt6 = conn1.createStatement();
                                        ResultSet rs2 = stmt6.executeQuery("SELECT ingredientname from Lactate");
                                        while(rs2.next()) {
                                            String ingredient = rs2.getString("ingredientname");
                                            out.println( "<input type=\"checkbox\" name=\"selectii\" value="+ingredient+">"+ StringUtils.capitalize(ingredient)+"<br>");
                                        }

                                    } catch(Exception ex){

                                    }
                            %>


                        <input type="submit" name="submit" value="Avoid">
                        </form>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="post-heading">
                        <h3>Cereale</h3>
                        <form action="ingredientsAvoidServlet" method="post">
                        <input type="hidden" name="selectii" value="<%=idut_user_inceput%>">
                            <%

                                response.setContentType("text/html");
                                Statement stmt7 ;
                                if(conn1!=null)
                                    try {

                                        stmt7 = conn1.createStatement();
                                        ResultSet rs2 = stmt7.executeQuery("SELECT ingredientname from Cereale");
                                        while(rs2.next()) {
                                            String ingredient = rs2.getString("ingredientname");
                                            out.println( "<input type=\"checkbox\" name=\"selectii\" value="+ingredient+">"+ StringUtils.capitalize(ingredient)+"<br>");
                                        }

                                    } catch(Exception ex){

                                    }
                            %>


                        <input type="submit" name="submit" value="Avoid">
                        </form>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="post-heading">
                        <h3>Produse chimice</h3>
                        <form action="ingredientsAvoidServlet" method="post">
                        <input type="hidden" name="selectii" value="<%=idut_user_inceput%>">
                            <%

                                response.setContentType("text/html");
                                Statement stmt8 ;
                                if(conn1!=null)
                                    try {

                                        stmt8 = conn1.createStatement();
                                        ResultSet rs2 = stmt8.executeQuery("SELECT ingredientname from produse_chimice");
                                        while(rs2.next()) {
                                            String ingredient = rs2.getString("ingredientname");
                                            out.println( "<input type=\"checkbox\" name=\"selectii\" value="+ingredient+">"+ StringUtils.capitalize(ingredient)+"<br>");
                                        }

                                    } catch(Exception ex){

                                    }
                            %>


                        <input type="submit" name="submit" value="Avoid">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
 </div>
<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
<!-- javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.fancybox.pack.js"></script>
<script src="js/jquery.fancybox-media.js"></script>
<script src="js/google-code-prettify/prettify.js"></script>
<script src="js/portfolio/jquery.quicksand.js"></script>
<script src="js/portfolio/setting.js"></script>
<script src="js/jquery.flexslider.js"></script>
<script src="js/animate.js"></script>
<script src="js/custom.js"></script>

</body>
</html>