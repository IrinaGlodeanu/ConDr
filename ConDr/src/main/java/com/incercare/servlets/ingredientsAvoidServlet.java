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

@WebServlet("/ingredientsAvoidServlet")
public class ingredientsAvoidServlet extends HttpServlet {

    private static void insertAvoidIngredient(int idul_userului,String nume_ingredient) throws SQLException {

        OracleConn oracleConn = new OracleConn();
        Connection conn15 = oracleConn.getConn();
        PreparedStatement ps = null;
        Statement st = conn15.createStatement();

        try {
            ps = conn15.prepareStatement("INSERT INTO userAvoidIngredient( userid,IngredientName) VALUES (?, ?)");
            ps.setInt(1, idul_userului);
            ps.setString(2, nume_ingredient);
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
            if (conn15 != null) {
                try {
                    conn15.close();
                } catch (SQLException e) {
                    System.err.println("SQLException: " + e.getMessage());
                }
            }
        }

    }
    private static void unavoidIngredient(int idul_userului,String nume_ingredient) throws SQLException {

        OracleConn oracleConn = new OracleConn();
        Connection conn16 = oracleConn.getConn();
        PreparedStatement ps = null;
        Statement st = conn16.createStatement();

        try {
            ps = conn16.prepareStatement("DELETE FROM userAvoidIngredient WHERE userid=? and ingredientname=?");
            ps.setInt(1, idul_userului);
            ps.setString(2, nume_ingredient);
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
            if (conn16 != null) {
                try {
                    conn16.close();
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
        if (request.getParameter("submit_unavoid") != null) {

            String[] Selectii = request.getParameterValues("selectii");
            PrintWriter out = response.getWriter();

            int primul = 0;
            int id_user = 0;
            int flag = 0;
            for (String s : Selectii) {
                if (primul == 0) {
                    id_user = Integer.parseInt(s);
                    primul = 1;
                } else
                {

                    try {
                        unavoidIngredient(id_user, s);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }

            this.getServletContext().getRequestDispatcher("/ingredientsAvoid.jsp").forward(request, response);

        } else if (request.getParameter("submit") != null) {


            String[] Selectii = request.getParameterValues("selectii");
            PrintWriter out = response.getWriter();

            int primul = 0;
            int id_user = 0;
            int flag = 0;
            for (String s : Selectii) {
                if (primul == 0) {
                    id_user = Integer.parseInt(s);
                    primul = 1;
                } else try {
                    flag = 0;
                    response.setContentType("text/html");
                    Statement stmt4 = null;
                    if (conn17 != null)
                        try {
                            stmt4 = conn17.createStatement();

                            ResultSet rs3 = stmt4.executeQuery(" select * from userAvoidIngredient where userid=" + id_user + "");
                            while (rs3.next()) {
                                String verif_ingredient_id = rs3.getString("INGREDIENTNAME");

                                if (verif_ingredient_id.contains(s)) {
                                    flag = 1;
                                }

                            }
                            //RequestDispatcher rd = getServletContext().getRequestDispatcher("/ingredientsAvoid.jsp");
                            //rd.include(request, response);
                        } catch (SQLException e) {
                            System.err.println("SQLException: " + e.getMessage());
                        }
                    if (flag == 0) {
                        insertAvoidIngredient(id_user, s);
                    }


                } catch (SQLException e) {
                    e.printStackTrace();
                }finally {
                    try {
                        conn17.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }

            this.getServletContext().getRequestDispatcher("/ingredientsAvoid.jsp").forward(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
