<%@ page import="com.connections.OracleConn" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.CallableStatement" %>
<%@ page import="java.sql.Types" %><%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 6/7/2017
  Time: 7:11 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Statistici</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <!-- css -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
    <link href="css/jcarousel.css" rel="stylesheet" />
    <link href="css/flexslider.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet"/>
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
    OracleConn oracleConn1 = new OracleConn();
    Connection conn1 = oracleConn1.getConn();
    response.setContentType("text/html");
    int full_id=0;
    Statement stmt4=null;
    if(conn1!=null)
        try {
            stmt4 = conn1.createStatement();

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

    <section class="callaction">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="big-cta">
                        <div class="cta-text">
                            <h2><span>Statistici</span></h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="content">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="box">
                                <div class="box-gray aligncenter" style="height:260px">
                                    <h4>Cel mai popular utilizator</h4>
                                    <div class="icon">
                                        <i class="fa fa-smile-o fa-3x"></i>
                                    </div>
                                    <p>
                                            <%

                                            Statement stmt2;
                                            if(conn1!=null)
                                                try {
                                                    stmt2 = conn1.createStatement();
                                                    ResultSet rs2 = stmt2.executeQuery("SELECT ID_MOST_POPULAR_USER from statitics");
                                                    while(rs2.next()) {
                                                        int most_popular_user = rs2.getInt("ID_MOST_POPULAR_USER");
                                                        out.println( "<form action=\"checkProfilColeg\" method=\"POST\" class=\"pull-right\" >");
                                                        out.println( "<input type=\"hidden\" name=\"id_coleg\" value="+most_popular_user+">");

                                                        Statement stmt101;
                                                        String nameMostPopular="";
                                                        String prenameMostPopular="";

                                                        if(conn1!=null)
                                                            try {
                                                                stmt101 = conn1.createStatement();
                                                                ResultSet rs19 = stmt101.executeQuery("SELECT nume, prenume from useri where userID="+most_popular_user+"");
                                                                while (rs19.next())
                                                                {
                                                                    nameMostPopular = rs19.getString("nume");
                                                                    prenameMostPopular = rs19.getString("prenume");
                                                                }
                                                            } catch(Exception ex){
                                                                ex.printStackTrace();
                                                            }

                                                        out.println("Cel mai popular user este <strong>" + nameMostPopular.toUpperCase() + " " + prenameMostPopular.toUpperCase() + " </strong>");
                                                        out.println("</p>");

                                                        out.println(  "</div>");
                                                        out.println( "<center><input style=\"width:260px\" type=\"submit\" class=\"btn box-bottom\" value=\"Viziteaza-l!\"></center>");
                                                        out.println("</form>");
                                                    }
                                                } catch(Exception ex){
                                                }
                                %>

                                </div>
                            </div>
                            <!-- e ok aici  fara div ca e in println-->
                            <div class="col-lg-3">
                                <div class="box">
                                    <div class="box-gray aligncenter" style="height:260px">
                                        <h4>Cel mai putin popular utilizator</h4>
                                        <div class="icon">
                                            <i class="fa fa-frown-o fa-3x"></i>
                                        </div>
                                        <p>
                                                <%

                                            Statement stmt22;
                                            if(conn1!=null)
                                                try {
                                                    stmt22 = conn1.createStatement();
                                                    ResultSet rs22 = stmt22.executeQuery("SELECT ID_LEAST_POPULAR_USER from statitics");
                                                    while(rs22.next()) {
                                                        int leastPopularUser = rs22.getInt("ID_LEAST_POPULAR_USER");
                                                        out.println( "<form action=\"checkProfilColeg\" method=\"POST\" class=\"pull-right\" >");
                                                        out.println( "<input type=\"hidden\" name=\"id_coleg\" value="+leastPopularUser+">");
                                                        Statement stmt102;
                                                        String nameLeastPopular="";
                                                        String prenameLeastPopular="";

                                                        if(conn1!=null)
                                                            try {
                                                                stmt102 = conn1.createStatement();
                                                                ResultSet rs19 = stmt102.executeQuery("SELECT nume, prenume from useri where userID="+leastPopularUser+"");
                                                                while (rs19.next())
                                                                {
                                                                    nameLeastPopular = rs19.getString("nume");
                                                                    prenameLeastPopular = rs19.getString("prenume");
                                                                }
                                                            } catch(Exception ex){
                                                                ex.printStackTrace();
                                                            }

                                                        out.println("Cel mai putin popular user este <strong>" + nameLeastPopular.toUpperCase() + " " + prenameLeastPopular.toUpperCase() + " </strong>");
                                                        out.println("</p>");
                                                        out.println(  "</div>");
                                                        out.println( "<center><input style=\"width:260px\" type=\"submit\" class=\"btn box-bottom\" value=\"Viziteaza-l!\"></center>");
                                                        out.println("</form>");
                                                    }
                                                } catch(Exception ex){
                                                }
                                %>

                                    </div>
                                </div>
                                <!-- e ok aici  fara div ca e in println-->
                                <div class="col-lg-3">
                                    <div class="box">
                                        <div class="box-gray aligncenter" style="height:260px">
                                            <h4>Cea mai sprijinita campanie de catre utilizatori</h4>
                                            <div class="icon">
                                                <i class="fa fa-users fa-3x"></i>
                                            </div>
                                            <p>
                                                    <%

                                            Statement stmt3;
                                            if(conn1!=null)
                                                try {
                                                    stmt3 = conn1.createStatement();
                                                    ResultSet rs3 = stmt3.executeQuery("SELECT ID_MOST_LIKED_CAMPAIGN  from statitics");
                                                    while(rs3.next()) {
                                                        int mostLikedCampaign = rs3.getInt("ID_MOST_LIKED_CAMPAIGN");
                                                        out.println( "<form action=\"campanieServlet\" method=\"POST\" class=\"pull-right\" >");
                                                        out.println( "<input type=\"hidden\" name=\"idut_campanie\" value="+mostLikedCampaign+">");

                                                         String nameMostLikedCampaign="";

                                                        Statement statmnt92;
                                                        if(conn1!=null)
                                                            try {
                                                                statmnt92 = conn1.createStatement();
                                                                ResultSet rs92 = statmnt92.executeQuery("SELECT CAMPAIGNNAME  from campaign where CAMPAIGNID="+mostLikedCampaign+"");
                                                                while (rs92.next())
                                                                {
                                                                    nameMostLikedCampaign = rs92.getString("CAMPAIGNNAME");
                                                                }
                                                            } catch(Exception ex){
                                                                ex.printStackTrace();
                                                            }

                                                        out.println("Cea mai apreciata campanie pentru userii nostri este  <strong>" + nameMostLikedCampaign.toUpperCase() + "</strong>");
                                                        out.println("</p>");
                                                        out.println( "</div>");
                                                        out.println( "<center><input style=\"width:260px\" type=\"submit\" class=\"btn box-bottom\" value=\"Arunca o privire!\"></center>");
                                                        out.println("</form>");
                                                    }
                                                } catch(Exception ex){
                                                }
                                %>

                                        </div>
                                    </div>
                                    <!-- e ok aici  fara div ca e in println-->
                                    <div class="col-lg-3">
                                        <div class="box">
                                            <div class="box-gray aligncenter" style="height:260px">
                                                <h4>Cea mai putin sprijinita campanie de catre utilizatori</h4>
                                                <div class="icon">
                                                    <i class="fa fa-thumbs-o-down fa-3x"></i>
                                                </div>
                                                <p>
                                                        <%

                                            Statement stmt44;
                                            if(conn1!=null)
                                                try {
                                                    stmt44 = conn1.createStatement();
                                                    ResultSet rs44 = stmt44.executeQuery("SELECT ID_LEAST_LIKED_CAMPAIGN  from statitics");
                                                    while(rs44.next()) {
                                                        int leastLikedCampaign = rs44.getInt("ID_LEAST_LIKED_CAMPAIGN");
                                                        out.println( "<form action=\"campanieServlet\" method=\"POST\" class=\"pull-right\" >");
                                                        out.println( "<input type=\"hidden\" name=\"idut_campanie\" value="+leastLikedCampaign+">");

                                                        String nameLeastLikedCampaign="";

                                                        Statement statmnt92;
                                                        if(conn1!=null)
                                                            try {
                                                                statmnt92 = conn1.createStatement();
                                                                ResultSet rs92 = statmnt92.executeQuery("SELECT CAMPAIGNNAME  from campaign where CAMPAIGNID="+leastLikedCampaign+"");
                                                                while (rs92.next())
                                                                {
                                                                    nameLeastLikedCampaign = rs92.getString("CAMPAIGNNAME");
                                                                }
                                                            } catch(Exception ex){
                                                                ex.printStackTrace();
                                                            }

                                                        out.println("Cea mai putin placuta campanie pentru userii nostri este  <strong>" + nameLeastLikedCampaign.toUpperCase() + "</strong>");
                                                        out.println("</p>");
                                                        out.println( "</div>");
                                                        out.println( "<center><input style=\"width:260px\" type=\"submit\" class=\"btn box-bottom\" value=\"Arunca o privire!!\"></center>");
                                                        out.println("</form>");
                                                    }
                                                } catch(Exception ex){
                                                }
                                %>

                                            </div>
                                        </div>
                                        <!-- e ok aici  fara div ca e in println-->
                                        <div class="col-lg-3">
                                            <div class="box">
                                                <div class="box-gray aligncenter" style="height:250px">
                                                    <h4>Cel mai dezirabil produs</h4>
                                                    <div class="icon">
                                                        <i class="fa fa-cutlery fa-3x"></i>
                                                    </div>
                                                    <p>
                                                            <%

                                            Statement stmt5;
                                            if(conn1!=null)
                                                try {
                                                    stmt5 = conn1.createStatement();
                                                    ResultSet rs5 = stmt5.executeQuery("SELECT id_most_desired_product  from statitics");
                                                    while(rs5.next()) {
                                                        int mostDesiredProduct = rs5.getInt("id_most_desired_product");
                                                        out.println( "<form action=\"checkProduct\" method=\"POST\" class=\"pull-right\" >");
                                                        out.println( "<input type=\"hidden\" name=\"id_produs\" value="+mostDesiredProduct+">");

                                                        String nameDesirableProduct="";

                                                        Statement statmnt93;
                                                        if(conn1!=null)
                                                            try {
                                                                statmnt93 = conn1.createStatement();
                                                                ResultSet rs9 = statmnt93.executeQuery("SELECT PRODNAME  from products where PRODID="+mostDesiredProduct+"");
                                                                while (rs9.next())
                                                                {
                                                                    nameDesirableProduct = rs9.getString("PRODNAME");
                                                                }
                                                            } catch(Exception ex){
                                                                ex.printStackTrace();
                                                            }


                                                        out.println("Cel mai dezirabil produs pentru userii nostri este  <strong>" + nameDesirableProduct.toUpperCase() + "</strong>");
                                                        out.println("</p>");
                                                        out.println(  "</div>");
                                                        out.println( "<center><input style=\"width:260px\" type=\"submit\" class=\"btn box-bottom\" value=\"Incearca-l!\"></center>");
                                                        out.println("</form>");
                                                    }
                                                } catch(Exception ex){
                                                }
                                %>

                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="box">
                                                    <div class="box-gray aligncenter" style="height:250px">
                                                        <h4>Cel mai indezirabil produs</h4>
                                                        <div class="icon">
                                                            <i class="fa fa-times fa-3x"></i>
                                                        </div>
                                                        <p>
                                                                <%

                                            Statement stmt6;
                                            if(conn1!=null)
                                                try {
                                                    stmt6 = conn1.createStatement();
                                                    ResultSet rs6 = stmt6.executeQuery("SELECT id_least_desired_product  from statitics");
                                                    while(rs6.next()) {
                                                        int leastDesiredProduct = rs6.getInt("id_least_desired_product");
                                                        out.println( "<form action=\"checkProduct\" method=\"POST\" class=\"pull-right\" >");
                                                        out.println( "<input type=\"hidden\" name=\"id_produs\" value="+leastDesiredProduct+">");

                                                        String nameUndesirableProduct="";

                                                        Statement statmnt9;
                                                        if(conn1!=null)
                                                            try {
                                                                statmnt9 = conn1.createStatement();
                                                                ResultSet rs9 = statmnt9.executeQuery("SELECT PRODNAME  from products where PRODID="+leastDesiredProduct+"");
                                                                while (rs9.next())
                                                                {
                                                                    nameUndesirableProduct = rs9.getString("PRODNAME");
                                                                }
                                                            } catch(Exception ex){
                                                                ex.printStackTrace();
                                                            }


                                                        out.println("Cel mai indezirabil produs pentru userii nostri este  <strong>" + nameUndesirableProduct.toUpperCase() + "</strong>");
                                                        out.println("</p>");
                                                        out.println( "</div>");
                                                        out.println( "<center><input style=\"width:260px\" type=\"submit\" class=\"btn box-bottom\" value=\"Incearca-l!\"></center>");
                                                        out.println("</form>");
                                                    }
                                                } catch(Exception ex){
                                                }
                                %>

                                                    </div>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="box">
                                                        <div class="box-gray aligncenter" style="height:250px">
                                                            <h4>Cel mai periculos ingredient</h4>
                                                            <div class="icon">
                                                                <i class="fa fa-ambulance fa-3x"></i>
                                                            </div>
                                                            <p>
                                                                    <%
                                            Statement stmt8;
                                            if(conn1!=null)
                                                try {
                                                    stmt8 = conn1.createStatement();
                                                    ResultSet rs8 = stmt8.executeQuery("SELECT ID_MOST_ALEGENIC_INGREDIENT  from statitics");
                                                    while(rs8.next()) {
                                                        String mostAlegenicIngredient = rs8.getString("ID_MOST_ALEGENIC_INGREDIENT");

                                                        out.println( "<form action=\"profil.jsp\" method=\"POST\" class=\"pull-right\" >");
                                                        out.println("Cel mai alergenic ingredient este " + "<strong>" + mostAlegenicIngredient.toUpperCase() +"</strong>");
                                                        out.println("</p>");
                                                        out.println( "</div>");
                                                        out.println( "<center><input style=\"width:260px\" type=\"submit\" class=\"btn box-bottom\" value=\"Ia vezi! Tu il ai?\"></center>");
                                                        out.println("</form>");
                                                    }
                                                } catch(Exception ex){

                                                }
                                %>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </div>
    </section>


    <section class="callaction">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="big-cta">
                        <div class="cta-text">
                            <h2><span>Recomandari</span></h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- divider -->
    <div class="row">
        <div class="col-lg-12">
            <div class="solidline">
            </div>
        </div>
    </div>
    <!-- divider -->
    <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="box">
                                <div class="box-gray aligncenter" style="height:250px">
                                    <h4>Un posibil produs</h4>
                                    <div class="icon">
                                        <i class="fa fa-leaf fa-3x"></i>
                                    </div>
                                    <p>
                                            <%

                                        String sql15 = "{ ? = call sugestii_pt_user.RecomandaProdusByCategorie(?) }";

                                        String nameRecommendedProduct="";

                                        CallableStatement statement41 = conn1.prepareCall(sql15);
                                        String idCurrentUser13= Integer.toString(full_id);
                                        statement41.setString(2,idCurrentUser13);
                                        statement41.registerOutParameter(1, Types.INTEGER);

                                        statement41.execute();

                                        int idRecommendedProduct = statement41.getInt(1);
                                        out.println( "<form action=\"checkProduct\" method=\"POST\" class=\"pull-right\" >");
                                        out.println( "<input type=\"hidden\" name=\"id_produs\" value="+idRecommendedProduct+">");

                                        Statement stmt79;
                                        if(conn1!=null)
                                            try {
                                                stmt79 = conn1.createStatement();
                                                ResultSet rs9 = stmt79.executeQuery("SELECT PRODNAME  from products where prodID="+idRecommendedProduct+"");
                                                while (rs9.next())
                                                {
                                                    nameRecommendedProduct = rs9.getString("PRODNAME");
                                                }
                                                out.println("Conform algoritmului nostru, <strong>" + nameRecommendedProduct.toUpperCase() + "</strong> , s-ar putea sa-ti placa..");
                                                out.println("</p>");
                                                out.println("</div>");
                                                out.println("<center><input style=\"width:260px\" type=\"submit\" class=\"btn box-bottom\" value=\"Incearca-l!\"></center>");
                                                out.println("</form>");
                                            } catch(Exception ex){
                                                ex.printStackTrace();
                                            }
                                    %>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="box">
                                    <div class="box-gray aligncenter" style="height:250px">
                                        <h4>O noua campanie</h4>
                                        <div class="icon">
                                            <i class="fa fa-comment-o fa-3x"></i>
                                        </div>
                                        <p>
                                                <%
                                        String sql1 = "{ ? = call sugestii_pt_user.supportCampaignByCategory(?) }";

                                        String nameRecommendedCampaign="";

                                        CallableStatement statement1 = conn1.prepareCall(sql1);
                                        String idCurrentUser1= Integer.toString(full_id);
                                        statement1.setString(2,idCurrentUser1);
                                        statement1.registerOutParameter(1, Types.INTEGER);

                                        statement1.execute();
                                        //this is the main line
                                        int idRecommendedCampaign = statement1.getInt(1);
                                        out.println( "<form action=\"campanieServlet\" method=\"POST\" class=\"pull-right\" >");
                                        out.println( "<input type=\"hidden\" name=\"idut_campanie\" value="+idRecommendedCampaign+">");
                                        Statement stmt9;
                                        if(conn1!=null)
                                            try {
                                                stmt9 = conn1.createStatement();
                                                ResultSet rs9 = stmt9.executeQuery("SELECT CAMPAIGNNAME  from campaign where CAMPAIGNID="+idRecommendedCampaign+"");
                                                while (rs9.next())
                                                {
                                                    nameRecommendedCampaign = rs9.getString("CAMPAIGNNAME");
                                                }
                                                out.println("Conform algoritmului nostru, campania  <strong>" + nameRecommendedCampaign.toUpperCase() + "</strong> , s-ar putea sa ti se para interesanta..");
                                                out.println("</p>");

                                                out.println(  "</div>");
                                                out.println( "<center><input style=\"width:260px\" type=\"submit\" class=\"btn box-bottom\" value=\"Arunca o privire!\"></center>");
                                                out.println("</form>");
                                            } catch(Exception ex){
                                                ex.printStackTrace();
                                            }
                                    %>

                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="box">
                                        <div class="box-gray aligncenter" style="height:250px">
                                            <h4>Un nou amic!!</h4>
                                            <div class="icon">
                                                <i class="fa fa-mobile fa-3x"></i>
                                            </div>
                                            <%
                                                String sql2 = "{ ? = call sugestii_pt_user.recomandaUnAltUser(?) }";

                                                String nameRecommendedFriend="";
                                                String prenameRecommendedFriend="";

                                                CallableStatement statement2 = conn1.prepareCall(sql2);
                                                String idCurrentUser2= Integer.toString(full_id);
                                                statement2.setString(2,idCurrentUser2);
                                                statement2.registerOutParameter(1, Types.INTEGER);

                                                statement2.execute();

                                                int idRecommendedFriend = statement2.getInt(1);

                                                Statement stmt10;

                                                if(conn1!=null)
                                                    try {
                                                        stmt10 = conn1.createStatement();
                                                        ResultSet rs19 = stmt10.executeQuery("SELECT nume, prenume from useri where userID="+idRecommendedFriend+"");
                                                        while (rs19.next())
                                                        {
                                                            nameRecommendedFriend = rs19.getString("nume");
                                                            prenameRecommendedFriend = rs19.getString("prenume");
                                                        }
                                                    } catch(Exception ex){
                                                        ex.printStackTrace();
                                                    }

                                                out.println("Conform algoritmului nostru, " + "<strong>" + nameRecommendedFriend.toUpperCase() + " " + prenameRecommendedFriend.toUpperCase() + " </strong>" + "ti-ar putea fi prieten..");
                                                out.println("</p>");
                                                out.println( "</div>");
                                                out.println( "<form action=\"checkProfilColeg\" method=\"POST\" class=\"pull-right\" >");
                                                out.println( "<input type=\"hidden\" name=\"id_coleg\" value="+idRecommendedFriend+">");
                                                out.println( "<center><input style=\"width:260px\" type=\"submit\" class=\"btn box-bottom\" value=\"Viziteaza-l!\"></center>");
                                                out.println("</form>");


                                                conn1.close();

                                            %>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
    </section>
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
</div>
</body>
</html>