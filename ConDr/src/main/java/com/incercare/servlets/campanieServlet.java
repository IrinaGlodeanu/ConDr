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


@WebServlet("/campanieServlet")
public class campanieServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int flag=0;
        String textNumber2 = request.getParameter("idut_campanie");
        int number2 = Integer.parseInt(textNumber2);

        System.out.println("Am intrat in campanieServlet: "+number2 + " " + number2);

        OracleConn oracleConn3 = new OracleConn();
        Connection conn10 = oracleConn3.getConn();
        response.setContentType("text/html");
        Statement stmt4=null;
        if(conn10!=null)
            try {
                stmt4 = conn10.createStatement();

                ResultSet rs3 = stmt4.executeQuery(" select * from campaign where campaignid="+number2+"");
                while(rs3.next()) {
                    int campaignid = rs3.getInt("campaignid");
                    String campaignname = rs3.getString("campaignname");
                    String campaigndescription = rs3.getString("campaigndescription");
                    Date dateofpublish = rs3.getDate("dateofpublish");
                    int idofowner = rs3.getInt("idofowner");
                    int numberofadherers = rs3.getInt("numberofadherers");
                    String path = rs3.getString("path");

                    request.setAttribute("campaignid",campaignid);
                    request.setAttribute("campaignname",campaignname);
                    request.setAttribute("campaigndescription",campaigndescription);
                    request.setAttribute("dateofpublish",dateofpublish);
                    request.setAttribute("idofowner",idofowner);
                    request.setAttribute("numberofadherers",numberofadherers);
                    request.setAttribute("path",path);

                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/campaignDescription.jsp");
                    rd.include(request, response);
                }
        } catch (SQLException e) {
            out.println(e.getMessage());
        }finally{
                try {
                    conn10.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
