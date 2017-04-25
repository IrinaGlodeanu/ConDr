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
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Alex on 22-Apr-17.
 */
@WebServlet("/checkProfilColeg")
public class checkProfilColeg extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int flag=0;
        try {

            String textNumber1 = request.getParameter("id_coleg");
            int number1 = Integer.parseInt(textNumber1);

            System.out.println("Am intrat in checkprofilColeg: "+number1 );

            OracleConn oracleConn3 = new OracleConn();
            Connection conn3 = oracleConn3.getConn();
            response.setContentType("text/html");
            Statement stmt4=null;

            String data_nastere_user ="";
            if(conn3!=null)
                try {
                    stmt4 = conn3.createStatement();
                    DateFormat sdf = new SimpleDateFormat("dd-MMM-yy");
                    ResultSet rs3 = stmt4.executeQuery(" select * from useri where userid="+number1+"");
                    while(rs3.next()) {
                        flag=1;
                        Date data_nastere_user2 = rs3.getTimestamp("data_nastere");
                        data_nastere_user = sdf.format( data_nastere_user2 );

                        int coleg_id = rs3.getInt("userid");
                        String coleg_nume = rs3.getString("nume");
                        String coleg_prenume = rs3.getString("prenume");
                        String coleg_email = rs3.getString("email");
                        request.setAttribute("coleg_id",coleg_id);
                        request.setAttribute("coleg_nume",coleg_nume);
                        request.setAttribute("coleg_prenume",coleg_prenume);
                        request.setAttribute("coleg_email",coleg_email);
                        request.setAttribute("coleg_data_nastere",data_nastere_user);

                        RequestDispatcher rd = getServletContext().getRequestDispatcher("/profilColeg.jsp");
                        rd.include(request, response);

                    }
                } catch (SQLException e) {
                    System.err.println("SQLException: " + e.getMessage());
                }

            if(flag==0){

                out.println("<div class=\"row\">");
                out.println("<div class=\"col-lg-12\">");
                out.println("<div class=\"alert alert-warning\">");
                out.println("<strong>Ba boule, </strong> Nu exista colegul asta.");
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
                this.getServletContext().getRequestDispatcher("/profil.jsp").forward(request, response);
            }
        } catch (Exception e) {
            out.println(e.getMessage());
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
