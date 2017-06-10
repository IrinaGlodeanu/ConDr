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


@WebServlet("/checkProduct")
public class checkProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int flag=0;
        try {
            String id_produs = request.getParameter("id_produs");
            int id_produs_parse = Integer.parseInt(id_produs);

            System.out.println(id_produs);


            PreparedStatement ps = null;

            if(conn11!=null)
                try {
                    ps = conn11.prepareStatement("SELECT * FROM products where prodid=?");
                    ps.setInt(1, id_produs_parse);
                    ResultSet rs3 = ps.executeQuery();

                    while(rs3.next()) {
                        flag=1;

                        String produs_descriere = rs3.getString("proddescription");
                        long produs_barcode = rs3.getLong("barcode");
                        String produs_poza = rs3.getString("path");
                        String nume_produs = rs3.getString("prodname");
                        request.setAttribute("produs_id",id_produs_parse);
                        request.setAttribute("produs_nume",nume_produs);
                        request.setAttribute("produs_descriere",produs_descriere);
                        request.setAttribute("produs_barcode",produs_barcode);
                        request.setAttribute("produs_poza",produs_poza);

                        RequestDispatcher rd = getServletContext().getRequestDispatcher("/productDescription.jsp");
                        rd.include(request, response);

                    }
                } catch (SQLException e) {
                    System.err.println("SQLException: " + e.getMessage());
                }

            if(flag==0){

                out.println("<div class=\"row\">");
                out.println("<div class=\"col-lg-12\">");
                out.println("<div class=\"alert alert-warning\">");
                out.println("<strong>Mai, </strong> Nu exista produsul asta.");
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
                this.getServletContext().getRequestDispatcher("/productSearch.jsp").forward(request, response);
            }
        } catch (Exception e) {
            out.println(e.getMessage());
        }finally {
            try {
                conn11.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
