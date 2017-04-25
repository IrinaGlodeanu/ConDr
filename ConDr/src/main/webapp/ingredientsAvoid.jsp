<%@page import="java.sql.*"%>
<%@ page import="com.connections.OracleConn" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
         pageEncoding="US-ASCII"%>


<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

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
    String user = (String) session.getAttribute("name"); //in user se pastreaza emailul
    String userName = null;
    String sessionID = null;
    Cookie[] cookies = request.getCookies();
    if(cookies !=null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("name")) userName = cookie.getValue();
            if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();  //doar daca vreau sa mai afisez id-ul
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
                    <a class="navbar-brand" href="#"><span>condr</span></a>
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
                            <input type="checkbox" name="selectii" value="rosie">Rosie<br>
                            <input type="checkbox" name="selectii" value="castravete">Castravete<br>
                            <input type="checkbox" name="selectii" value="spanac">Spanac<br>
                            <input type="checkbox" name="selectii" value="varza">Varza<br>
                            <input type="checkbox" name="selectii" value="ardei">Ardei<br>
                            <input type="checkbox" name="selectii" value="vanata">Vanata<br>
                            <input type="checkbox" name="selectii" value="brocoli">Brocoli<br>
                            <input type="checkbox" name="selectii" value="ceapa">Ceapa<br>
                            <input type="checkbox" name="selectii" value="cartofi">Cartofi<br>
                            <input type="checkbox" name="selectii" value="morcovi">Morcovi<br>
                            <input type="checkbox" name="selectii" value="telina">Telina<br>
                            <input type="checkbox" name="selectii" value="ridiche">Ridiche<br>
                            <input type="checkbox" name="selectii" value="ardei iute">Ardei iute<br>
                            <input type="submit" name="submit" value="Avoid"> //sau cu button- alt format
                        </form>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="post-heading">
                        <h3>Fructe</h3>
                        <form action="ingredientsAvoidServlet" method="post">
                            <input type="hidden" name="selectii" value="<%=idut_user_inceput%>">
                            <input type="checkbox" name="selectii" value="mar">Mar<br>
                            <input type="checkbox" name="selectii" value="para">Para<br>
                            <input type="checkbox" name="selectii" value="banana">Banana<br>
                            <input type="checkbox" name="selectii" value="kiwi">Kiwi<br>
                            <input type="checkbox" name="selectii" value="nuca">Nuca<br>
                            <input type="checkbox" name="selectii" value="alune">Alune<br>
                            <input type="checkbox" name="selectii" value="alune de padure">Alune de padure<br>
                            <input type="checkbox" name="selectii" value="portocala">Portocala<br>
                            <input type="checkbox" name="selectii" value="grepfruit">Grepfruit<br>
                            <input type="checkbox" name="selectii" value="piersica">Piersica<br>
                            <input type="checkbox" name="selectii" value="caisa">Caisa<br>
                            <input type="checkbox" name="selectii" value="capsuna">Capsuna<br>
                            <input type="checkbox" name="selectii" value="lamaie">Lamaie<br>
                            <input type="checkbox" name="selectii" value="strugure">Strugure<br>
                            <input type="submit" name="submit" value="Avoid">
                        </form>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="post-heading">
                        <h3>Produse Animale</h3>
                        <form action="ingredientsAvoidServlet" method="post">
                            <input type="hidden" name="selectii" value="<%=idut_user_inceput%>">
                            <input type="checkbox" name="selectii" value="carne de pui">Carne de pui<br>
                            <input type="checkbox" name="selectii" value="carne de vita">Carne de vita<br>
                            <input type="checkbox" name="selectii" value="carne de porc">Carne de porc<br>
                            <input type="checkbox" name="selectii" value="carne de peste">Carne de peste<br>
                            <input type="checkbox" name="selectii" value="ou">Ou<br>
                            <input type="checkbox" name="selectii" value="pene">Pene<br>
                            <input type="checkbox" name="selectii" value="blana">Blana<br>
                            <input type="submit" name="submit" value="Avoid">
                        </form>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="post-heading">
                        <h3>Asezonari</h3>
                        <form action="ingredientsAvoidServlet" method="post">
                            <input type="hidden" name="selectii" value="<%=idut_user_inceput%>">
                            <input type="checkbox" name="selectii" value="zahar">Zahar<br>
                            <input type="checkbox" name="selectii" value="sare">Sare<br>
                            <input type="checkbox" name="selectii" value="piper">Piper<br>
                            <input type="checkbox" name="selectii" value="hamei">Hamei<br>
                            <input type="checkbox" name="selectii" value="cimbru">Cimbru<br>
                            <input type="checkbox" name="selectii" value="patrunjel">Patrunjel<br>
                            <input type="checkbox" name="selectii" value="leustean">Leustean<br>
                            <input type="checkbox" name="selectii" value="marar">Marar<br>
                            <input type="checkbox" name="selectii" value="chimen">Chimen<br>
                            <input type="checkbox" name="selectii" value="oregano">Oregano<br>
                            <input type="checkbox" name="selectii" value="paprika">Paprika<br>
                            <input type="checkbox" name="selectii" value="cacao">Cacao<br>
                            <input type="checkbox" name="selectii" value="menta">Menta<br>
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
                            <input type="checkbox" name="selectii" value="Lapte de vaca">Lapte de vaca<br>
                            <input type="checkbox" name="selectii" value="Lapte de bivolita">Lapte de bivolita<br>
                            <input type="checkbox" name="selectii" value="Lapte de capra">Lapte de capra<br>
                            <input type="checkbox" name="selectii" value="Lapte de oaie">Lapte de oaie<br>
                            <input type="checkbox" name="selectii" value="Zer">Zer<br>
                            <input type="checkbox" name="selectii" value="Lapte praf">Lapte praf<br>
                            <input type="checkbox" name="selectii" value="Lapte condensat">Lapte condensat<br>
                            <input type="submit" name="submit" value="Avoid">
                        </form>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="post-heading">
                        <h3>Cereale</h3>
                        <form action="ingredientsAvoidServlet" method="post">
                            <input type="hidden" name="selectii" value="<%=idut_user_inceput%>">
                            <input type="checkbox" name="selectii" value="grau">Grau<br>
                            <input type="checkbox" name="selectii" value="orez">Orez<br>
                            <input type="checkbox" name="selectii" value="porumb">Porumb<br>
                            <input type="checkbox" name="selectii" value="ovaz">Ovaz<br>
                            <input type="checkbox" name="selectii" value="secara">Secara<br>
                            <input type="checkbox" name="selectii" value="orz">Orz<br>
                            <input type="checkbox" name="selectii" value="hrisca">Hrisca<br>
                            <input type="checkbox" name="selectii" value="soia">Soia<br>
                            <input type="checkbox" name="selectii" value="naut">Naut<br>
                            <input type="submit" name="submit" value="Avoid">
                        </form>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="post-heading">
                        <h3>Produse chimice</h3>
                        <form action="ingredientsAvoidServlet" method="post">
                            <input type="hidden" name="selectii" value="<%=idut_user_inceput%>">
                            <input type="checkbox" name="selectii" value="naftalina">Naftalina<br>
                            <input type="checkbox" name="selectii" value="colorant alimentar">Colorant alimentar<br>
                            <input type="checkbox" name="selectii" value="mercur">Mercur<br>
                            <input type="checkbox" name="selectii" value="E456">E456<br>
                            <input type="checkbox" name="selectii" value="E308">E308<br>
                            <input type="checkbox" name="selectii" value="aditiv de crestere">Aditiv de crestere<br>
                            <input type="checkbox" name="selectii" value="guma guar">Guma guar<br>
                            <input type="checkbox" name="selectii" value="guma xantan">Guma xantan<br>
                            <input type="checkbox" name="selectii" value="acid ascorbic">Acid ascorbic<br>
                            <input type="checkbox" name="selectii" value="aditiv de afanare">Aditiv de afanare<br>
                            <input type="checkbox" name="selectii" value="cheag">Cheag<br>
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