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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Created by Alex on 09-Jun-17.
 */
@WebServlet("/addCampaign")
public class addCampaign extends HttpServlet {

    private static void insertNewCampaign(String nume,String descriere,String path,String[]arr,int ownerId) throws SQLException, ParseException {

        OracleConn oracleConn = new OracleConn();
        Connection conn = oracleConn.getConn();
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        Statement st = conn.createStatement();


        int id_nou=-1;
        try {

            ResultSet rs= st.executeQuery("select max(campaignid) from campaign");
            while(rs.next()){
                id_nou=rs.getInt("max(campaignid)");
            }

            id_nou=id_nou+1;

            String strDate =  LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

            ps = conn.prepareStatement("INSERT INTO campaign( campaignid,campaignname,campaigndescription,idofowner,numberofadherers,path) VALUES (?,?,?,?,?,?)");
            ps.setInt(1, id_nou);
            ps.setString(2, nume);
            ps.setString(3, descriere);
          //  ps.setDate(4, java.sql.Date.valueOf(strDate));
            ps.setInt(4, ownerId);
            ps.setInt(5,  0);
            ps.setString(6, path);
            ps.executeUpdate();
            ps.clearParameters();

            for ( String ss : arr) {

                int id_categorie=Integer.parseInt(ss);
                ps2 = conn.prepareStatement("INSERT INTO campaigncampaigncategory( campaignid,categoryid) VALUES (?,?)");
                ps2.setInt(1, id_nou);
                ps2.setInt(2,  id_categorie);
                ps2.executeUpdate();
                ps2.clearParameters();
            }

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

            String campaign_nume = request.getParameter("campaign_nume");
            String campaign_descriere = request.getParameter("campaign_descriere");
            String campaign_path = request.getParameter("campaign_path");
            String campaign_categorii = request.getParameter("campaign_categorii");
            String ownerId2 = request.getParameter("ownerId");
            int ownerId=Integer.parseInt(ownerId2);

            String[] arr = campaign_categorii.split(" ");

            for ( String ss : arr) {
                System.out.println(ss);
            }

            if(campaign_nume.equals("") || campaign_descriere.equals("")||campaign_path.equals("")||campaign_categorii.equals(""))
            {
                flag=1;
                RequestDispatcher rd;
                rd = getServletContext().getRequestDispatcher("/insertCampaign.jsp");
                out.println("<div class=\"row\">");
                out.println("<div class=\"col-lg-12\">");
                out.println("<div class=\"alert alert-warning\">");
                out.println("<strong>:(, </strong>Nu ai introdus toate datele.");
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
                rd.include(request, response);
            }

            System.out.println("Am intrat in addCampaign: "+campaign_nume);

            Statement stmt4=null;
            if(flag==0)
            try {
                insertNewCampaign(campaign_nume,campaign_descriere,campaign_path,arr,ownerId);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/categorii.jsp");
            out.println("<div class=\"row\">");
            out.println("<div class=\"col-lg-12\">");
            out.println("<div class=\"alert alert-succes\">");
            out.println("<strong>:), </strong>Campanie creata cu succes.");
            out.println("</div>");
            out.println("</div>");
            out.println("</div>");
            rd.include(request, response);

        } catch (SQLException e) {
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
