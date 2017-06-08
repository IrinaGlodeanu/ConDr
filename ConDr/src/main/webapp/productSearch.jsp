<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 23-Apr-17
  Time: 2:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*"%>
<%@ page import="com.connections.OracleConn" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="sun.misc.IOUtils" %>
<%@ page import="org.json.JSONTokener" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
         pageEncoding="US-ASCII"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Search</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="http://bootstraptaste.com" />
    <!-- css -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
    <link href="css/jcarousel.css" rel="stylesheet" />
    <link href="css/flexslider.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="./css/test.css" />


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
                    <a class="navbar-brand" href="index.html">condr</a>
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

    <section id="content">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">

                    <ul id="myList" class="list-unstyled">
                        <%

                                String text1 = request.getParameter("nume_prod_de_la_user");

                                System.out.println("Am intrat in checkProductSearch: "+text1 );

                                OracleConn oracleConn3 = new OracleConn();
                                Connection conn3 = oracleConn3.getConn();
                                response.setContentType("text/html");
                                //PE ASTA E FACUT INDEX
                            Statement stmt4=null;
                                if(conn3!=null)
                                    try {
                                        String query=" select * from products where lower(prodname) like lower('%"+text1+"%')";
                                        System.out.println(query);
                                        int flag=0;
                                        stmt4 = conn3.createStatement();

                                        ResultSet rs3 = stmt4.executeQuery(query);
                                        while(rs3.next()) {
                                            if(flag==0){System.out.println("am intrat in WHILE");flag=1;};

                                            String produs_nume = rs3.getString("prodname");
                                            int produs_id = rs3.getInt("prodid");
                                            out.println(" <li class=\"alert alert-warning\" style=\"display:none;\">"+produs_nume+"");
                                            out.println( "<form action=\"checkProduct\" method=\"POST\" >");
                                            out.println( "<input type=\"hidden\" name=\"nume_produs\" value=\""+produs_nume+"\">");
                                            out.println( "<input type=\"hidden\" name=\"id_produs\" value="+produs_id+">");
                                            out.println( "<button type=\"submit\" class=\"btn btn-theme pull-right\">Check Product</button>");
                                            out.println("</form>");
                                            out.println("</li>");
                                        }


                                    } catch (SQLException e) {
                                        System.err.println("SQLException: " + e.getMessage());
                                    }

                        %>
                    </ul>
                    <div id="loadMore" style="color:green; cursor:pointer;">Load more</div>
                    <div id="showLess" style=" color:red; cursor:pointer;">Show less</div>

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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        size_li = $("#myList li").size();
        x=3;
        $('#myList li:lt('+x+')').show();
        $('#loadMore').click(function () {
            x= (x+5 <= size_li) ? x+5 : size_li;
            $('#myList li:lt('+x+')').show();
            $('#showLess').show();
            if(x == size_li){
                $('#loadMore').hide();
            }
        });
        $('#showLess').click(function () {
            x=(x-5<0) ? 3 : x-5;
            $('#myList li').not(':lt('+x+')').hide();
            $('#loadMore').show();
            $('#showLess').show();
            if(x == 3){
                $('#showLess').hide();
            }
        });
    });</script>
</body>
</html>