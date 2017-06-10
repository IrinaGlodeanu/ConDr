<%@page import="java.sql.*"%>
<%@ page import="com.connections.OracleConn" %>
<%@ page import="java.sql.Date" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
         pageEncoding="US-ASCII"%>


<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Profil</title>
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
<%
    OracleConn oracleConn5 = new OracleConn();
    Connection conn5 = oracleConn5.getConn();

    int full_id=0;
    response.setContentType("text/html");
    Statement stmt5=null;
    if(conn5!=null)
        try {

            stmt5 = conn5.createStatement();
            ResultSet rs = stmt5.executeQuery(" select * from useri where email='"+userName+"'");
            while(rs.next()) {
                full_id = rs.getInt("userid");
            }
        } catch(Exception ex){

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
                    <a class="navbar-brand" href="categorii.jsp"><span>c</span>on<span>d</span>r</a>
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
                        <li><a href="stats.jsp">Statistici</a></li>
                        <li> <a href="CheckoutPage.jsp">Checkout Page</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <!-- end header -->
    <%
       int campaign_id=(int) request.getAttribute("campaignid");
       String campaign_name=(String) request.getAttribute("campaignname");
        String campaign_description=(String) request.getAttribute("campaigndescription");
       Date campaign_date=(Date) request.getAttribute("dateofpublish");
        int campaign_owner_id = (int)request.getAttribute("idofowner");
        int campaign_adherers=(int)request.getAttribute("numberofadherers");
        String campaign_path=(String)request.getAttribute("path");
        System.out.println(campaign_path);
    %>
    <section id="content">
        <div class="container">
            <div class="row">
                <div class="container">
                    <div class="span3 well">
                        <center>
                            <img src='<%=campaign_path%>' name="aboutme" width="200" height="200" border="0">
                            <h3 class="media-heading"><%=campaign_name %></h3>

                            <span><strong>Adherers: </strong></span>
                            <span class="label label-success"><%=campaign_adherers %></span>

                        </center>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                     <span class="label label-info"><strong>Description: </strong></span>
                        <span><%=campaign_description%></span>

                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">

                </div>
            </div>
            <div  class="row">

                <div class="col-lg-12">

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