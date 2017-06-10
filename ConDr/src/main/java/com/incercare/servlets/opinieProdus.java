package com.incercare.servlets;

import com.connections.OracleConn;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/opinieProdus")
public class opinieProdus extends HttpServlet {

    private static void insertAsCumpara(int id_user,int id_produs) throws SQLException {

        OracleConn oracleConn = new OracleConn();
        Connection conn18 = oracleConn.getConn();
        PreparedStatement ps = null;
        Statement st = conn18.createStatement();

        try {

            PreparedStatement statement = conn18.prepareStatement("DELETE FROM useravoidproduct WHERE userid=? and prodid=?");
            statement.setInt(1, id_user);
            statement.setInt(2, id_produs);
            statement.executeUpdate();
            statement.clearParameters();

            ps = conn18.prepareStatement("INSERT INTO usersupportproduct( userid,prodid) VALUES (?, ?)");
            ps.setInt(1, id_user);
            ps.setInt(2, id_produs);
            ps.executeUpdate();
            ps.clearParameters();
        } catch (SQLException e) {
            System.err.println("SQLException: " + e.getMessage());
        }
        finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    System.err.println("SQLException: " + e.getMessage());
                }
            }
            if (conn18 != null) {
                try {
                    conn18.close();
                } catch (SQLException e) {
                    System.err.println("SQLException: " + e.getMessage());
                }
            }
        }

    }
    private static void insertNuAsCumpara(int id_user,int id_produs) throws SQLException {

        OracleConn oracleConn = new OracleConn();
        Connection conn19 = oracleConn.getConn();
        PreparedStatement ps = null;
        Statement st = conn19.createStatement();

        try {

            PreparedStatement statement = conn19.prepareStatement("DELETE FROM usersupportproduct WHERE userid=? and prodid=?");
            statement.setInt(1, id_user);
            statement.setInt(2, id_produs);
            statement.executeUpdate();
            statement.clearParameters();

            ps = conn19.prepareStatement("INSERT INTO useravoidproduct( userid,prodid) VALUES (?, ?)");
            ps.setInt(1, id_user);
            ps.setInt(2, id_produs);
            ps.executeUpdate();
            ps.clearParameters();
        } catch (SQLException e) {
            System.err.println("SQLException: " + e.getMessage());
        }
        finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    System.err.println("SQLException: " + e.getMessage());
                }
            }
            if (conn19 != null) {
                try {
                    conn19.close();
                } catch (SQLException e) {
                    System.err.println("SQLException: " + e.getMessage());
                }
            }
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        OracleConn oracleConn3 = new OracleConn();
        Connection conn17 = oracleConn3.getConn();
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        if (request.getParameter("as_cumpara") != null) {

            int flag=0;
            try {

                String textNumber1 = request.getParameter("id_user");
                String textNumber2 = request.getParameter("id_produs");
                int id_user = Integer.parseInt(textNumber1);
                int id_produs = Integer.parseInt(textNumber2);

                System.out.println("Am intrat in opinieProdus as cumpara: "+id_user + " " + id_produs);

                Statement stmt4=null;
                if(conn17!=null)
                    try {
                        stmt4 = conn17.createStatement();

                        ResultSet rs3 = stmt4.executeQuery(" select * from usersupportproduct where userid="+id_user+"");
                        while(rs3.next()) {
                            int verif_prod_id = rs3.getInt("prodid");
                            if(verif_prod_id==id_produs)
                            {
                                flag=1;
                                RequestDispatcher rd;
                                rd = getServletContext().getRequestDispatcher("/productDescription.jsp");
                                out.println("<div class=\"row\">");
                                out.println("<div class=\"col-lg-12\">");
                                out.println("<div class=\"alert alert-warning\">");
                                out.println("<strong>:(, </strong> Ai dat deja \"As cumpara\" la produsul asta.");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");


                                PreparedStatement ps = conn17.prepareStatement("SELECT * FROM products where prodid=?");
                                ps.setInt(1, verif_prod_id);
                                ResultSet rs17 = ps.executeQuery();

                                while(rs17.next()) {
                                    String produs_descriere = rs17.getString("proddescription");
                                    long produs_barcode = rs17.getLong("barcode");
                                    String produs_poza = rs17.getString("path");
                                    String nume_produs = rs17.getString("prodname");
                                    request.setAttribute("produs_id", verif_prod_id);
                                    request.setAttribute("produs_nume", nume_produs);
                                    request.setAttribute("produs_descriere", produs_descriere);
                                    request.setAttribute("produs_barcode", produs_barcode);
                                    request.setAttribute("produs_poza", produs_poza);
                                }


                                rd.include(request, response);
                            }
                        }
                    } catch (SQLException e) {
                        System.err.println("SQLException: " + e.getMessage());
                    }

                if(flag==0){
                    insertAsCumpara(id_user,id_produs);


                    PreparedStatement ps = conn17.prepareStatement("SELECT * FROM products where prodid=?");
                    ps.setInt(1, id_produs);
                    ResultSet rs17 = ps.executeQuery();

                    while(rs17.next()) {
                        String produs_descriere = rs17.getString("proddescription");
                        long produs_barcode = rs17.getLong("barcode");
                        String produs_poza = rs17.getString("path");
                        String nume_produs = rs17.getString("prodname");
                        request.setAttribute("produs_id", id_produs);
                        request.setAttribute("produs_nume", nume_produs);
                        request.setAttribute("produs_descriere", produs_descriere);
                        request.setAttribute("produs_barcode", produs_barcode);
                        request.setAttribute("produs_poza", produs_poza);
                    }

                    this.getServletContext().getRequestDispatcher("/productDescription.jsp").forward(request, response);
                }
            } catch (SQLException e) {
                out.println(e.getMessage());
            }finally {
                try {
                    conn17.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }


        }
        else if (request.getParameter("nu_as_cumpara") != null) {

            int flag=0;
            try {

                String textNumber1 = request.getParameter("id_user");
                String textNumber2 = request.getParameter("id_produs");
                int id_user = Integer.parseInt(textNumber1);
                int id_produs = Integer.parseInt(textNumber2);

                System.out.println("Am intrat in opinieProdus as cumpara: "+id_user + " " + id_produs);

                Statement stmt4=null;
                if(conn17!=null)
                    try {
                        stmt4 = conn17.createStatement();

                        ResultSet rs3 = stmt4.executeQuery(" select * from useravoidproduct where userid="+id_user+"");
                        while(rs3.next()) {
                            int verif_prod_id = rs3.getInt("prodid");
                            if(verif_prod_id==id_produs)
                            {
                                flag=1;
                                RequestDispatcher rd;
                                rd = getServletContext().getRequestDispatcher("/productDescription.jsp");
                                out.println("<div class=\"row\">");
                                out.println("<div class=\"col-lg-12\">");
                                out.println("<div class=\"alert alert-warning\">");
                                out.println("<strong>:(, </strong> Ai dat deja \"Nu as cumpara\" la produsul asta.");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");

                                PreparedStatement ps = conn17.prepareStatement("SELECT * FROM products where prodid=?");
                                ps.setInt(1, verif_prod_id);
                                ResultSet rs17 = ps.executeQuery();

                                while(rs17.next()) {
                                    String produs_descriere = rs17.getString("proddescription");
                                    long produs_barcode = rs17.getLong("barcode");
                                    String produs_poza = rs17.getString("path");
                                    String nume_produs = rs17.getString("prodname");
                                    request.setAttribute("produs_id", verif_prod_id);
                                    request.setAttribute("produs_nume", nume_produs);
                                    request.setAttribute("produs_descriere", produs_descriere);
                                    request.setAttribute("produs_barcode", produs_barcode);
                                    request.setAttribute("produs_poza", produs_poza);
                                }

                                rd.include(request, response);
                            }
                        }
                    } catch (SQLException e) {
                        System.err.println("SQLException: " + e.getMessage());
                    }

                if(flag==0){
                    insertNuAsCumpara(id_user,id_produs);

                    PreparedStatement ps = conn17.prepareStatement("SELECT * FROM products where prodid=?");
                    ps.setInt(1, id_produs);
                    ResultSet rs17 = ps.executeQuery();

                    while(rs17.next()) {
                        String produs_descriere = rs17.getString("proddescription");
                        long produs_barcode = rs17.getLong("barcode");
                        String produs_poza = rs17.getString("path");
                        String nume_produs = rs17.getString("prodname");
                        request.setAttribute("produs_id", id_produs);
                        request.setAttribute("produs_nume", nume_produs);
                        request.setAttribute("produs_descriere", produs_descriere);
                        request.setAttribute("produs_barcode", produs_barcode);
                        request.setAttribute("produs_poza", produs_poza);
                    }

                    this.getServletContext().getRequestDispatcher("/productDescription.jsp").forward(request, response);
                }
            } catch (SQLException e) {
                out.println(e.getMessage());
            }finally {
                try {
                    conn17.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

        }

        }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
