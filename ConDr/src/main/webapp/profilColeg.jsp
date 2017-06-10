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

    OracleConn oracleConn = new OracleConn();
    Connection conn9 = oracleConn.getConn();

    int full_id=0;
    response.setContentType("text/html");
    Statement stmt4=null;
    if(conn9!=null)
        try {
            stmt4 = conn9.createStatement();
            ResultSet rs = stmt4.executeQuery(" select * from useri where email='"+userName+"'");
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
        response.setContentType("text/html");
        int coleg_id=(Integer) request.getAttribute("coleg_id");
        String coleg_nume=(String) request.getAttribute("coleg_nume");
        String coleg_prenume=(String) request.getAttribute("coleg_prenume");
        String coleg_email=(String) request.getAttribute("coleg_email");
        String coleg_data_nastere=(String) request.getAttribute("coleg_data_nastere");
        String coleg_full_name=coleg_prenume+" "+coleg_nume;

    %>
    <section id="content">
        <div class="container">
            <div class="row">
                <div class="container">
                    <div class="span3 well">
                        <center>
                            <img src="http://localhost:8082/img/<%=coleg_email%>.jpg" name="aboutme" width="140" height="140" border="0" class="img-circle"></a>
                            <h3 class="media-heading"><%=coleg_full_name %></h3>
                            <span><strong>Data Nastere: </strong></span>
                            <span class="label label-info"><%=coleg_data_nastere%></span>
                            <span><strong>Email: </strong></span>
                            <span class="label label-success"><%=coleg_email %></span>

                            <form method="post" action="followUser">
                                <input type="hidden" name="id_propriu"  value="<%=full_id%>"/>
                                <input type="hidden" name="id_coleg"  value="<%=coleg_id%>"/>
                                <input type="submit" value="Follow">
                            </form>
                            <!-- de facut daca mai e timp un query aici pentru a nu se afisa unul dintre butoane daca nu apare in tabela follow la idul nostru -->
                            <form method="post" action="unfollowUser">
                                <input type="hidden" name="id_propriu"  value="<%=full_id%>"/>
                                <input type="hidden" name="id_coleg"  value="<%=coleg_id%>"/>
                                <input type="submit" value="unFollow">
                            </form>

                        </center>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                        <ul class="nav nav-tabs">
                            <li  class="active"><a href="#one" data-toggle="tab"><i class="icon-briefcase"></i>Followers</a></li>
                            <li><a href="#two" data-toggle="tab">Following</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="one">
                                <%
                                    Statement stmt5=null;
                                    Statement stmt8=null;
                                    if(conn9!=null)
                                        try {

                                            stmt5 = conn9.createStatement();
                                            ResultSet rs = stmt5.executeQuery(" select * from follow where userid2="+coleg_id+"");
                                            while(rs.next()) {

                                                int follower = rs.getInt("userid1");

                                                String follower_full_name ="";
                                                stmt8 = conn9.createStatement();
                                                ResultSet rs2 = stmt8.executeQuery("select * from useri where userid="+follower+"" );
                                                while(rs2.next()) {
                                                    String follower_nume = rs2.getString("nume");
                                                    String follower_prenume = rs2.getString("prenume");
                                                    follower_full_name = follower_prenume+" "+follower_nume;
                                                }

                                                out.println( "<div class=\"alert alert-info\">");
                                                out.println( "<strong>"+follower_full_name+"</strong>");
                                                out.println( "<form action=\"checkProfilColeg\" method=\"POST\" class=\"pull-right\">");
                                                out.println( "<input type=\"hidden\" name=\"id_coleg\" value="+follower+">");
                                                out.println( "<button type=\"submit\" class=\"btn btn-theme\">Check Profile</button>");
                                                out.println("</form>");
                                                out.println("</div>");

                                            }
                                        } catch(Exception ex){
                                            System.out.println("eroare");
                                        }
                                %>
                            </div>
                            <div class="tab-pane" id="two">

                                <%

                                    System.out.println("full id din profilColeg.jsp: "+coleg_id);
                                    Statement stmt6=null;
                                    Statement stmt7=null;
                                    if(conn9!=null)
                                        try {
                                            stmt6 = conn9.createStatement();
                                            ResultSet rs = stmt6.executeQuery("select * from follow where userid1="+coleg_id+"");
                                            while(rs.next()) {

                                                int following = rs.getInt("userid2");

                                                String following_full_name ="";
                                                stmt7 = conn9.createStatement();
                                                ResultSet rs2 = stmt7.executeQuery("select * from useri where userid="+following+"" );
                                                while(rs2.next()) {
                                                    String following_nume = rs2.getString("nume");
                                                    String following_prenume = rs2.getString("prenume");
                                                    following_full_name = following_prenume+" "+following_nume;
                                                }
                                                out.println( "<div class=\"alert alert-info\">");
                                                out.println( "<p>");
                                                out.println( "<strong>"+following_full_name+"</strong>");
                                                out.println( "<form action=\"checkProfilColeg\" method=\"POST\" class=\"pull-right\" >");
                                                out.println( "<input type=\"hidden\" name=\"id_coleg\" value="+following+">");
                                                out.println( "<button type=\"submit\" class=\"btn btn-theme\">Check Profile</button>");
                                                out.println("</form>");
                                                out.println( "</p>");
                                                out.println("</div>");

                                            }
                                        } catch(Exception ex){

                                        }
                                %>

                            </div>

                    </div>
                </div>


            </div>
            <div  class="row">

                <div class="col-lg-12">
                    <ul class="portfolio-categ filter">
                        <li   class="all active"><a href="#">All</a></li>

                        <%

                            Statement stmt=null;
                            if(conn9!=null)
                                try {

                                    stmt = conn9.createStatement();

                                    ResultSet rs = stmt.executeQuery(" select * from categcampaign");
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
                    <section id="projects">
                        <ul class="portfolio">

                            <%
                                Statement stmt1=null;
                                Statement stmt2=null;
                                if(conn9!=null)
                                    try {
                                        HashMap<Integer, ArrayList<Integer>> data = new HashMap<Integer,  ArrayList<Integer>>();
                                        stmt2 = conn9.createStatement();
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
                                        stmt1 = conn9.createStatement();
                                        int trecut=0;

                                        ResultSet rs = stmt1.executeQuery(" select * from campaign a,support b,useri c where a.campaignid=b.campaignid and b.userid=c.userid and c.email='"+coleg_email+"'");
                                        while(rs.next()) {
                                            id_campaign = rs.getInt("campaignid");
                                            String s = rs.getString("campaignname");
                                            String s2 = rs.getString("CAMPAIGNDESCRIPTION");
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
                                            out.println( "<li class=\"item-thumbs col-lg-12 design\" data-id=\"id-0\" data-type='"+id_de_pus+"'>");
                                            out.println( "<article>");
                                            out.println( "<div class=\"post-image\">");
                                            out.println( "<div class=\"post-heading\">");
                                            out.println( "<h3>"+s+"</h3>");
                                            out.println( "</div>");
                                            out.println( "</div>");
                                            out.println( "<p>"+s2+"</p>");
                                            out.println( "<div class=\"bottom-article\">");
                                            out.println( "<ul class=\"meta-post\">");
                                            out.println( "<li><i class=\"icon-calendar\"></i><a href=\"#\"> Mar 23, 2013</a></li>");
                                            out.println( "</ul>");
                                           // out.println( "<a href=\"#\" class=\"pull-right\">Continue reading <i class=\"icon-angle-right\"></i></a>");

                                            out.println( "<form action=\"insertSupport\" method=\"POST\" >");
                                            out.println( "<input type=\"hidden\" name=\"idut_user\" value="+full_id+">");
                                            out.println( "<input type=\"hidden\" name=\"idut_campanie\" value="+id_campaign+">");
                                            out.println( "<input type=\"submit\" name=\"submit_profil_coleg\" value=\"Follow\" class=\"pull-right\">");
                                            out.println("</form>");
                                            out.println( "</div>");

                                            out.println( "</article>");
                                            out.println( "</li>");
                                        }
                                    } catch(Exception ex){

                                    }finally{
                                        conn9.close();
                                    }
                            %>


                        </ul>
                    </section>
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