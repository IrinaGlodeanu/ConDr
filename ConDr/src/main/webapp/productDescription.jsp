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
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
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
                    <a class="navbar-brand" href="index.jsp"><span>c</span>on<span>d</span>r</a>
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
        int produs_id=(int) request.getAttribute("produs_id");
        String produs_nume=(String) request.getAttribute("produs_nume");
        String produs_descriere=(String) request.getAttribute("produs_descriere");
        long produs_barcode=(Long) request.getAttribute("produs_barcode");
        String produs_poza=(String) request.getAttribute("produs_poza");

    %>
    <section id="content">
        <div class="container">
            <div class="row">
                <div class="container">
                    <div class="span3 well">
                        <center>
                            <img src="<%=produs_poza%>" name="aboutme" width="200" height="200" border="0">
                            <h3 class="media-heading"><%=produs_nume %></h3>

                            <span><strong>Descriere: </strong></span>
                            <span class="label label-info"><%=produs_descriere%></span>
                            <span><strong>Barcode: </strong></span>
                            <span class="label label-success"><%=produs_barcode %></span>
                        </center>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <p>Acest produs intra in conflict cu campaniile: </p>
                    <ul>
                    <%

                        OracleConn oracleConn3 = new OracleConn();
                        Connection conn = oracleConn3.getConn();

                        response.setContentType("text/html");
                        Statement stmt=null;
                        Statement stmt2=null;
                        Statement stmt7=null;
                        String nume_campaign="";
                        int id_campaign1;
                        ArrayList<Integer> lista_id= new ArrayList<>();
                        if(conn!=null)
                            try {
                                stmt7 = conn.createStatement();
                                ResultSet rs7 = stmt7.executeQuery("select * from avoid where userid="+full_id+"");
                                while(rs7.next()) {
                                    id_campaign1=rs7.getInt("campaignid");
                                    lista_id.add(id_campaign1);
                                }

                                stmt = conn.createStatement();
                                ResultSet rs = stmt.executeQuery(" select * from AVOIDPRODUCTCAMPAIGN where prodid="+produs_id+"");
                                while(rs.next()) {
                                    int id_campaign = rs.getInt("campaignid");
                                    stmt2 = conn.createStatement();
                                    ResultSet rs2 = stmt2.executeQuery(" select campaignname from campaign where campaignid="+id_campaign+"");
                                    while(rs2.next()) {
                                        nume_campaign=rs2.getString("campaignname");
                                    }
                                   if(!lista_id.contains(id_campaign)) out.println( "<li>"+nume_campaign+"</li>");
                                    else out.println( "<li><font color=\"red\">"+nume_campaign+"</font></li>");
                                }
                            } catch(Exception ex){

                            }finally {
                                lista_id.clear();
                            }
                    %>
                    </ul>
                </div>
            </div>
            <div  class="row">

                <div class="col-lg-12">
                    <p>Acest produs sprijina campaniile: </p>
                    <ul>
                    <%

                        OracleConn oracleConn6 = new OracleConn();
                        Connection conn6 = oracleConn6.getConn();

                        response.setContentType("text/html");
                        Statement stmt3=null;
                        Statement stmt4=null;
                        int id_campaign2;
                        String nume_campaign2="";
                        ArrayList<Integer> lista_id2= new ArrayList<>();
                        if(conn6!=null)
                            try {
                                int id_campaign;
                                stmt7 = conn6.createStatement();
                                ResultSet rs7 = stmt7.executeQuery("select * from support where userid="+full_id+"");
                                while(rs7.next()) {
                                    id_campaign2=rs7.getInt("campaignid");
                                    lista_id2.add(id_campaign2);
                                }

                                stmt3 = conn6.createStatement();
                                ResultSet rs6 = stmt3.executeQuery("select * from SUPPORTPRODUCTCAMPAIGN where prodid="+produs_id+"");
                                while(rs6.next()) {
                                     id_campaign = rs6.getInt("campaignid");
                                    stmt4 = conn6.createStatement();
                                    ResultSet rs8 = stmt4.executeQuery("select campaignname from campaign where campaignid="+id_campaign+"");
                                    while(rs8.next()) {
                                        nume_campaign2=rs8.getString("campaignname");
                                    }
                                    if(!lista_id2.contains(id_campaign)) out.println( "<li>"+nume_campaign2+"</li>");
                                        else out.println( "<li><font color=\"green\">"+nume_campaign2+"</font></li>");
                                }
                            } catch(Exception ex){

                            }finally{
                                lista_id2.clear();
                            }
                    %>
                    </ul>
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