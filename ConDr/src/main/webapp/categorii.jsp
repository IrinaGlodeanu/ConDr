<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 20-Apr-17
  Time: 11:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*"%>
<%@ page import="com.connections.OracleConn" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
         pageEncoding="US-ASCII"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Categorii</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="http://bootstraptaste.com" />
    <!-- css -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
    <link href="css/jcarousel.css" rel="stylesheet" />
    <link href="css/flexslider.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/test.css" rel="stylesheet" />


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
   <!-- AICI DECOMENTEZ CA SA ARAT ID SESIUNE, SI USER PRIMIT
   <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-success">
                <strong>Buna <%=userName %>,</strong> v-ati logat cu succes. ID-ul sesiunii dumneavoastra este <%=sessionID %>
            </div>
        </div>
    </div>-->
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
                        <li>  <a href="CheckoutPage.jsp">Checkout Page</a></li>
<!--
                        <li>
                            <form action="LogoutServlet" method="post" class="inline">
                            <input type="hidden" value="Logout" >
                            <button  type="submit" value="Logout" class="link-button">
                                Logout
                            </button>
                        </form>
                        </li>-->


                    </ul>
                </div>
            </div>
        </div>
    </header>
    <!-- end header -->

    <section id="content">
        <div class="container">


            <%

                OracleConn oracleConn3 = new OracleConn();
                Connection conn3 = oracleConn3.getConn();
                int idut_user_inceput=0;
                response.setContentType("text/html");
                Statement stmt3=null;
                Statement stmt4=null;
                if(conn3!=null)
                    try {
                        stmt4 = conn3.createStatement();

                        ResultSet rs3 = stmt4.executeQuery(" select * from useri where email='"+userName+"'");
                        while(rs3.next()) {
                            idut_user_inceput = rs3.getInt("userid");
                            int isModerator = rs3.getInt("isModerator");
                            if(isModerator==1) {
                                out.println(" <div class=\"row\">");
                                out.println(" <div class=\"col-lg-12\">");
                                out.println( "<form action=\"insertCampaign.jsp\" method=\"POST\" >");
                                out.println( "<input type=\"submit\" value=\"Add Campaign\">");
                                out.println("</form>");
                                out.println("</div>");
                                out.println("</div>");
                            }
                        }


                    } catch(Exception ex){

                    }
            %>
            <div class="row">
                <div class="col-lg-12">
                    <ul class="portfolio-categ filter">
                        <li class="all active"><a href="#">All</a></li>
                        <%

                            if(conn3!=null)
                                try {
                                    stmt3 = conn3.createStatement();

                                    ResultSet rs = stmt3.executeQuery(" select * from categcampaign");
                                    while(rs.next()) {
                                        //int n = rs.getInt("PRODID");
                                        int id_categ = rs.getInt("CATEGORYID");
                                        String id_categ2 = Integer.toString(id_categ);
                                        String nume_categ = rs.getString("CATEGORYNAME");
                                        //  String s2 = rs.getString("BARCODE");
                                        // System.out.println(n + " " + s + " " + s2);
                                        out.println( "<li class='"+id_categ2+"'><a href=\"#\" title=\"\">"+nume_categ+"</a></li>");
                                    }
                                } catch(Exception ex){

                                }
                        %>

                    </ul>
                    <div class="clearfix">
                    </div>
                    <div class="row">
                        <section id="projects">
                            <ul id="thumbs" class="portfolio">

                                <%


                                    Statement stmt1=null;
                                    Statement stmt2=null;
                                    if(conn3!=null)
                                        try {
                                            HashMap<Integer, ArrayList<Integer>> data = new HashMap<Integer,  ArrayList<Integer>>();
                                            stmt2 = conn3.createStatement();
                                            int id_campaign=0;
                                            int id_test=1;
                                            ArrayList<Integer> iduri_categ=new ArrayList<Integer>();

                                            ResultSet rs2 = stmt2.executeQuery("select CAMPAIGNID,CATEGORYID from campaigncampaigncategory group by  CAMPAIGNID,CATEGORYID order by campaignid");
                                            while(rs2.next()) {
                                                int id_categ = rs2.getInt("CATEGORYID");
                                                id_campaign = rs2.getInt("CAMPAIGNID");
                                                if(id_campaign != id_test){
                                                    if (data.get(id_test) == null)data.put(id_test, new ArrayList<Integer>());
                                                    for(int i=0;i<iduri_categ.size();i++)
                                                        data.get(id_test).add(iduri_categ.get(i));
                                                   // data.put(id_test,iduri_categ);
                                                  // System.out.println("LISTA ASTA CONTINE contains: "+ id_test + iduri_categ.toString());
                                                    iduri_categ.clear();
                                                }

                                                iduri_categ.add(id_categ);
                                                id_test=id_campaign;
                                            }
                                            if (data.get(id_test) == null)data.put(id_test, new ArrayList<Integer>());
                                            for(int i=0;i<iduri_categ.size();i++)
                                                data.get(id_test).add(iduri_categ.get(i));
                                            iduri_categ.clear();


                                            String id_de_pus="";
                                            stmt1 = conn3.createStatement();
                                            int trecut=0;
                                            int idut_user_preluat =0;
                                            int idut_campanie_preluat =0;


                                            ResultSet rs = stmt1.executeQuery("select * from campaign");
                                            while(rs.next()) {
                                                id_campaign = rs.getInt("campaignid");
                                                String s = rs.getString("campaignname");
                                                String s2 = rs.getString("CAMPAIGNDESCRIPTION");
                                                String s3 = rs.getString("path");
                                                id_de_pus="";
                                                ArrayList<Integer> list12 = new ArrayList<>();
                                                for (Map.Entry<Integer, ArrayList<Integer>> entry : data.entrySet()) {
                                                    //System.out.println("cheie: " +entry.getKey());
                                                    if (entry.getKey().equals(id_campaign)) {
                                                       // id_de_pus=id_de_pus+ " " + Integer.toString(entry.getValue());
                                                        list12= entry.getValue();
                                                        ArrayList<Integer> list13= data.get(id_campaign);
                                                       // System.out.println("Arraylist contains: " + list12.toString());


                                                        for (Integer i2 : list12)
                                                        {
                                                            id_de_pus += Integer.toString(i2) + " ";
                                                            //System.out.println(id_de_pus);
                                                        }
                                                        trecut++;
                                                       // System.out.println("aici a mai trecut"+trecut);
                                                    }}

                                                //  String s2 = rs.getString("BARCODE");
                                                // System.out.println(n + " " + s + " " + s2);
                                                out.println( "<li class=\"item-thumbs col-lg-3 design\" data-id=\"id-0\" data-type='"+id_de_pus+"'>");
                                                out.println( "<a class=\"hover-wrap fancybox\" data-fancybox-group=\"gallery\" title='"+s+"' href='"+s3+"'>");
                                                out.println( "<span class=\"overlay-img\"></span>");
                                                out.println( "<span class=\"overlay-img-thumb font-icon-plus\"></span>");
                                                out.println( " </a>");
                                               // out.println("<a href=\"#\" class=\"btn btn-small btn-warning\"><i class=\"fa fa-heart\"></i>Follow</a>");
                                               // out.println( " <img src=\"img/works/1.jpg\" alt='"+s2+"");
                                               // out.println( "<a href=\"#\" class=\"btn btn-small btn-warning pull-right\"><i class=\"fa fa-heart\"></i>Follow</a>'>");
                                                out.println( " <h5>"+s+"</h5>");
                                                out.println( " <img src='"+s3+"' alt='"+s2+"");
                                                out.println( "<form action=\"insertSupport\" method=\"POST\" >");
                                                out.println( "<input type=\"hidden\" name=\"idut_user\" value="+idut_user_inceput+">");
                                                out.println( "<input type=\"hidden\" name=\"idut_campanie\" value="+id_campaign+">");
                                                out.println( "<input type=\"submit\" class=\"btn btn-success pull-left\" value=\"Follow\">");
                                                out.println("</form>");
                                                out.println( "<form action=\"campanieServlet\" method=\"POST\" >");
                                                out.println( "<input type=\"hidden\" name=\"idut_campanie\" value="+id_campaign+">");
                                                out.println( "<input type=\"submit\" class=\"btn btn-warning pull-right\" value=\"Pagina\">");
                                                out.println("</form>");
                                                out.println( "<form action=\"insertAvoid\" method=\"POST\" >");
                                                out.println( "<input type=\"hidden\" name=\"idut_user\" value="+idut_user_inceput+">");
                                                out.println( "<input type=\"hidden\" name=\"idut_campanie\" value="+id_campaign+">");
                                                out.println( "<input type=\"submit\" class=\"btn btn-info\"  value=\"Nu ma intereseaza\">");
                                                out.println("</form>");
                                                out.println( "'>");

                                                out.println( "</li>");

                                            }
                                            if(idut_user_preluat!=0)
                                                System.out.println("Preluam idul user si campanie pt update: "+idut_user_preluat+" " +idut_campanie_preluat);

                                        } catch(Exception ex){

                                        }finally{
                                            conn3.close();
                                        }
                                %>

                            </ul>
                        </section>
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