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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Alex on 08-Jun-17.
 */
@WebServlet("/unfollowUser")
public class unfollowUser extends HttpServlet {

    private static void deleteFollow(int idul_userului,int idul_colegului) throws SQLException {

        OracleConn oracleConn = new OracleConn();
        Connection conn = oracleConn.getConn();
        PreparedStatement ps = null;
        Statement st = conn.createStatement();

        try {
            ps = conn.prepareStatement("DELETE FROM follow WHERE USERID1=? AND USERID2=?");
            ps.setInt(1, idul_userului);
            ps.setInt(2, idul_colegului);
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

        OracleConn oracleConn3 = new OracleConn();
        Connection conn3 = oracleConn3.getConn();
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int flag=0;
        try {

            String textNumber1 = request.getParameter("id_coleg");
            int id_coleg = Integer.parseInt(textNumber1);
            String textNumber2 = request.getParameter("id_propriu");
            int id_user = Integer.parseInt(textNumber2);

            System.out.println("Am intrat in unfollowUser: "+id_coleg );

            Statement stmt4=null;
            if(conn3!=null)
                try {
                    stmt4 = conn3.createStatement();
                    ResultSet rs3 = stmt4.executeQuery(" select * from follow where userid1="+id_user+"");
                    while(rs3.next()) {
                        int verif_coleg_id = rs3.getInt("userid2");
                        if(verif_coleg_id==id_coleg)
                        {
                            flag=1;
                            deleteFollow(id_user,id_coleg);
                            this.getServletContext().getRequestDispatcher("/profil.jsp").forward(request, response);

                        }
                    }
                } catch (SQLException e) {
                    System.err.println("SQLException: " + e.getMessage());
                }


            if(flag==0){
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/profil.jsp");
                out.println("<div class=\"row\">");
                out.println("<div class=\"col-lg-12\">");
                out.println("<div class=\"alert alert-warning\">");
                out.println("<strong>:(, </strong> Ai dat deja unfollow la userul asta.");
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
                rd.include(request, response);
            }
        } catch (Exception e) {
            out.println(e.getMessage());
        }finally {
            try {
                conn3.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
