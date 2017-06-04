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

import static java.lang.System.out;


@WebServlet("/insertSupport")
public class insertSupport extends HttpServlet {

    private static void insertAnotherSupport(int idul_userului,int idul_campaniei) throws SQLException {

        OracleConn oracleConn = new OracleConn();
        Connection conn = oracleConn.getConn();
        PreparedStatement ps = null;
        Statement st = conn.createStatement();

        try {
            ps = conn.prepareStatement("INSERT INTO support( userid,campaignid) VALUES (?, ?)");
            ps.setInt(1, idul_userului);
            ps.setInt(2, idul_campaniei);
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

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int flag=0;
        try {

        String textNumber1 = request.getParameter("idut_user");
        String textNumber2 = request.getParameter("idut_campanie");
        int number1 = Integer.parseInt(textNumber1);
        int number2 = Integer.parseInt(textNumber2);

        System.out.println("Am intrat in insertSupport: "+number1 + " " + number2);

            OracleConn oracleConn3 = new OracleConn();
            Connection conn3 = oracleConn3.getConn();
            response.setContentType("text/html");
            Statement stmt4=null;
            if(conn3!=null)
                try {
                    stmt4 = conn3.createStatement();

                    ResultSet rs3 = stmt4.executeQuery(" select * from support where userid="+number1+"");
                    while(rs3.next()) {
                        int verif_campaign_id = rs3.getInt("campaignid");
                        if(verif_campaign_id==number2)
                        {
                            flag=1;
                            RequestDispatcher rd = getServletContext().getRequestDispatcher("/categorii.jsp");
                            out.println("<div class=\"row\">");
                            out.println("<div class=\"col-lg-12\">");
                            out.println("<div class=\"alert alert-warning\">");
                            out.println("<strong>:(, </strong> Ai dat deja follow la campania asta.");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("</div>");
                            rd.include(request, response);
                        }
                    }
                } catch (SQLException e) {
                    System.err.println("SQLException: " + e.getMessage());
                }

        if(flag==0){insertAnotherSupport(number1,number2);

        this.getServletContext().getRequestDispatcher("/categorii.jsp").forward(request, response);}
        } catch (SQLException e) {
            out.println(e.getMessage());
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
