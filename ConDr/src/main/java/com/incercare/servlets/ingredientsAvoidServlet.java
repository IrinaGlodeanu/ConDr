package com.incercare.servlets;

import com.connections.OracleConn;

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
        Connection conn = oracleConn.getConn();
        PreparedStatement ps = null;
        Statement st = conn.createStatement();

        try {
            ps = conn.prepareStatement("INSERT INTO userAvoidIngredient( userid,IngredientName) VALUES (?, ?)"); //evitam sql injection
            ps.setInt(1, idul_userului);
            ps.setString(2, nume_ingredient);
            ps.executeUpdate(); //aici am introdus
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
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    System.err.println("SQLException: " + e.getMessage());
                }
            }
        }

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String[] Selectii=request.getParameterValues("selectii");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        OracleConn oracleConn3 = new OracleConn();
        Connection conn3 = oracleConn3.getConn();
        int primul=0;
        int id_user=0;
        int flag=0;

        for(String s : Selectii){
            if(primul==0){
                id_user = Integer.parseInt(s);
                primul=1;
            }
            else try {
                flag=0;
                response.setContentType("text/html");
                Statement stmt4=null;
                if(conn3!=null)
                    try {
                        stmt4 = conn3.createStatement();

                        ResultSet rs3 = stmt4.executeQuery(" select * from userAvoidIngredient where userid="+id_user+"");
                        while(rs3.next()) {
                            String produs_neplacut = rs3.getString("INGREDIENTNAME");

                            if(produs_neplacut.contains(s))  //verificam daca nu exista deja in tabela userAvoidIngredient
                            {
                                flag=1;                      //daca mai exista nu mai introduc odata
                            }

                        }
                        //RequestDispatcher rd = getServletContext().getRequestDispatcher("/ingredientsAvoid.jsp");
                        //rd.include(request, response);
                    } catch (SQLException e) {
                        System.err.println("SQLException: " + e.getMessage());
                    }
                if(flag==0){                            //daca nu exista, fac insert
                    insertAvoidIngredient(id_user,s);
                }


            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        this.getServletContext().getRequestDispatcher("/ingredientsAvoid.jsp").forward(request, response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

