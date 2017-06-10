<%@page import="java.sql.*"%>
<%@ page import="com.connections.OracleConn" %>
<%@ page import="java.util.*" %>
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
    OracleConn oracleConn = new OracleConn();
    Connection conn6 = oracleConn.getConn();

    int full_id=0;
    response.setContentType("text/html");
    Statement stmt5=null;
    if(conn6!=null)
        try {

            stmt5 = conn6.createStatement();
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
                            <br></br>
                            <form method="post" action="opinieProdus">
                                <input type="hidden" name="id_produs"  value="<%=produs_id%>"/>
                                <input type="hidden" name="id_user"  value="<%=full_id%>"/>
                                <input type="submit" name="as_cumpara" value="As cumpara">
                                <input type="submit" name="nu_as_cumpara" value="Nu as cumpara">
                            </form>
                        </center>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 alert-warning">
                    <p>Lista de ingrediente: </p>
                    <ul style="list-style-type: none;">
                   <%

                       Statement stmt10=null;
                       Statement stmt11=null;
                       String string_ingrediente="";
                       if(conn6!=null)
                           try {

                               stmt10 = conn6.createStatement();
                               ResultSet rs10 = stmt10.executeQuery("select * from INGREDIENTE where prodid="+produs_id+"");
                               while(rs10.next()) {
                                   string_ingrediente = rs10.getString("listaingrediente");
                               }
                               List<String> items = Arrays.asList(string_ingrediente.split(";"));
                                int flag=0;
                               for (String ingr:items ) {


                                   stmt11 = conn6.createStatement();
                                   ResultSet rs3 = stmt11.executeQuery(" select * from USERAVOIDINGREDIENT where userid="+full_id+"");
                                   while(rs3.next()) {
                                       String verif_ingr = rs3.getString("ingredientname");
                                       if(ingr.equals(verif_ingr))
                                       {
                                           flag=1;
                                           out.println("<a href=\"#\" class=\"btn btn-danger\">"+ingr+"</a>");
                                       }
                                   }
                                   if(flag==0)out.println( "<a href=\"#\" class=\"btn btn-success\">"+ingr+"</a>");
                                   flag=0;
                               }


                           } catch (SQLException e) {
                               System.err.println("SQLException: " + e.getMessage());
                           }

                    %>
                    </ul>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <p>Acest produs intra in conflict cu campaniile (iar cele cu rosu sunt cele pe care le sprijiniti): </p>
                    <ul style="list-style-type: none;">
                    <%
                        Statement stmt=null;
                        Statement stmt2=null;
                        Statement stmt7=null;
                        Statement stmt13=null;
                        String nume_campaign="";
                        int id_campaign1;
                        ArrayList<Integer> lista_id_avoid= new ArrayList<>();
                        ArrayList<Integer> lista_id_support= new ArrayList<>();
                        if(conn6!=null)
                            try {
                                stmt7 = conn6.createStatement();
                                ResultSet rs7 = stmt7.executeQuery("select * from avoid where userid="+full_id+"");
                                while(rs7.next()) {
                                    id_campaign1=rs7.getInt("campaignid");
                                    lista_id_avoid.add(id_campaign1);
                                }
                                stmt13 = conn6.createStatement();
                                ResultSet rs13 = stmt13.executeQuery("select * from support where userid="+full_id+"");
                                while(rs13.next()) {
                                    id_campaign1=rs13.getInt("campaignid");
                                    lista_id_support.add(id_campaign1);
                                }

                                stmt = conn6.createStatement();
                                ResultSet rs = stmt.executeQuery(" select * from AVOIDPRODUCTCAMPAIGN where prodid="+produs_id+"");
                                while(rs.next()) {
                                    int id_campaign = rs.getInt("campaignid");
                                    stmt2 = conn6.createStatement();
                                    ResultSet rs2 = stmt2.executeQuery(" select campaignname from campaign where campaignid="+id_campaign+"");
                                    while(rs2.next()) {
                                        nume_campaign=rs2.getString("campaignname");
                                    }
                                   if(lista_id_avoid.contains(id_campaign))
                                       out.println( "<li class=\"alert alert-success\">"+nume_campaign+"</li>");
                                  else if(lista_id_support.contains(id_campaign))
                                       out.println( "<li class=\"alert alert-danger\">"+nume_campaign+"</li>");
                                  else   out.println( "<li class=\"alert alert-info\">"+nume_campaign+"</li>");
                                }//daca eu support si produsu are campania la avoid va fi cu rosu, restu cu albastru
                            } catch(Exception ex){

                            }finally {
                                lista_id_support.clear();
                                lista_id_avoid.clear();
                            }
                    %>
                    </ul>
                </div>
            </div>
            <div  class="row">

                <div class="col-lg-12">
                    <p>Acest produs sprijina campaniile: </p>
                    <ul style="list-style-type: none;">
                    <%
                        Statement stmt33=null;
                        Statement stmt4=null;
                        Statement stmt17=null;
                        Statement stmt18=null;
                        int id_campaign2;
                        String nume_campaign2="";
                        ArrayList<Integer> lista_id_support2= new ArrayList<>();
                        ArrayList<Integer> lista_id_avoid2= new ArrayList<>();
                        if(conn6!=null)
                            try {
                                int id_campaign;
                                stmt18 = conn6.createStatement();
                                ResultSet rs7 = stmt18.executeQuery("select * from support where userid="+full_id+"");
                                while(rs7.next()) {
                                    id_campaign2=rs7.getInt("campaignid");
                                    lista_id_support2.add(id_campaign2);
                                }
                                stmt17 = conn6.createStatement();
                                ResultSet rs17 = stmt17.executeQuery("select * from avoid where userid="+full_id+"");
                                while(rs17.next()) {
                                    id_campaign2=rs17.getInt("campaignid");
                                    lista_id_avoid2.add(id_campaign2);
                                }

                                stmt33 = conn6.createStatement();
                                ResultSet rs6 = stmt33.executeQuery("select * from SUPPORTPRODUCTCAMPAIGN where prodid="+produs_id+"");
                                while(rs6.next()) {
                                     id_campaign = rs6.getInt("campaignid");
                                    stmt4 = conn6.createStatement();
                                    ResultSet rs8 = stmt4.executeQuery("select campaignname from campaign where campaignid="+id_campaign+"");
                                    while(rs8.next()) {
                                        nume_campaign2=rs8.getString("campaignname");
                                    }
                                    if(lista_id_support2.contains(id_campaign)) out.println( "<li class=\"alert alert-success\">"+nume_campaign2+"</li>");
                                   else if(lista_id_avoid2.contains(id_campaign))  out.println( "<li class=\"alert alert-danger\">"+nume_campaign2+"</li>");
                                   else  out.println( "<li class=\"alert alert-info\">"+nume_campaign2+"</li>");
                                }//daca eu sprijin si produsul avoid, va fi cu rosu, restul albastre
                            } catch(Exception ex){

                            }finally{
                                lista_id_avoid2.clear();
                                lista_id_support2.clear();
                                conn6.close();
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