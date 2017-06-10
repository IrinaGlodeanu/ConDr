<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 22-Apr-17
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*"%>
<%@ page import="com.connections.OracleConn" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="static com.sun.org.apache.xerces.internal.xinclude.XIncludeHandler.BUFFER_SIZE" %>
<%@ page import="com.sun.xml.internal.ws.util.StringUtils" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
         pageEncoding="US-ASCII"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
        response.setContentType("text/html");

        OracleConn oracleConn = new OracleConn();
        Connection conn9 = oracleConn.getConn();

        int full_id=0;
        int isModerator=0;
        response.setContentType("text/html");
        Statement stmt4=null;
        if(conn9!=null)
            try {
                stmt4 = conn9.createStatement();
                ResultSet rs = stmt4.executeQuery(" select * from useri where email='"+userName+"'");
                while(rs.next()) {
                    full_id = rs.getInt("userid");
                    isModerator = rs.getInt("isModerator");
                }


            } catch(Exception ex){

            }

        if(isModerator==1){
    %>
    <section id="content">
        <div class="container">

            <form action="addCampaign" method="post">

                <h1>Adaugati o Campanie noua</h1>

                <fieldset>
                    <label>Nume:</label>
                    <input type="text" name="campaign_nume">

                    <label >Descriere:</label>
                    <input type="text" name="campaign_descriere">

                    <label >Categorii:</label>
                    <input type="text" name="campaign_categorii">

                    <label >Path:</label>
                    <input type="text" name="campaign_path">
                    <input type="hidden" name="ownerId" value="<%=full_id%>">

                </fieldset>

                <button type="submit">Adauga</button>
            </form>
        </div>
    </section>

    <%
        }else{
    %>
    <section id="content">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Nu esti Moderator.</h2>
                </div>
            </div>
        </div>
    </section>
    <%
        }
        conn9.close();
    %>
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