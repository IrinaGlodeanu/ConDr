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



@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {

    private static void insertNewUser(String nume,String prenume,String parola, String email, String data_nastere ) throws SQLException, ParseException {

        OracleConn oracleConn = new OracleConn();
        Connection conn = oracleConn.getConn();
        PreparedStatement ps = null;
        Statement st = conn.createStatement();


        int id_nou=-1;
        try {

           ResultSet rs= st.executeQuery("select max(userid) from useri");
           while(rs.next()){
               id_nou=rs.getInt("max(userid)");
           }
            id_nou=id_nou+1;
            ps = conn.prepareStatement("INSERT INTO useri( userid,nume,prenume,password,email,data_nastere,logged,ismoderator) VALUES (?,?,?,?,?,?,?,?)");
            ps.setInt(1, id_nou);
            ps.setString(2, nume);
            ps.setString(3, prenume);
            ps.setString(4, parola);
            ps.setString(5, email);
            ps.setDate(6,  java.sql.Date.valueOf(data_nastere)); //nu se insereaza data
            ps.setInt(7, 0);
            ps.setInt(8, 0);
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

            String nume = request.getParameter("user_nume");
            String prenume = request.getParameter("user_prenume");
            String email = request.getParameter("user_email");
            String parola = request.getParameter("user_parola");
            String data_nastere = request.getParameter("user_nastere");

            if(nume.equals("") || prenume.equals("")||email.equals("")||parola.equals("")||data_nastere.equals("")){
                RequestDispatcher rd;
                rd = getServletContext().getRequestDispatcher("/register.jsp");
                out.println("<div class=\"row\">");
                out.println("<div class=\"col-lg-12\">");
                out.println("<div class=\"alert alert-warning\">");
                out.println("<strong>:(, </strong>Nu ai introdus toate datele.");
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
                rd.include(request, response);
            }

            System.out.println("Am intrat in insertSupport: "+nume + " " + prenume);

            Statement stmt4=null;
            if(conn3!=null)
                try {
                    stmt4 = conn3.createStatement();

                    ResultSet rs3 = stmt4.executeQuery(" select * from useri where email='"+email+"'");
                    while(rs3.next()) {
                        flag=1;
                        String email_preluat= rs3.getString("email");
                        RequestDispatcher rd;
                        rd = getServletContext().getRequestDispatcher("/register.jsp");
                        out.println("<div class=\"row\">");
                        out.println("<div class=\"col-lg-12\">");
                        out.println("<div class=\"alert alert-warning\">");
                        out.println("<strong>:(, </strong>Exista deja un cont pe mailul "+email_preluat+".");
                        out.println("</div>");
                        out.println("</div>");
                        out.println("</div>");
                        rd.include(request, response);

                    }
                } catch (SQLException e) {
                    System.err.println("SQLException: " + e.getMessage());
                }

            if(flag==0){
                try {
                    insertNewUser(nume,prenume,parola,email,data_nastere);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.html");
                out.println("<div class=\"row\">");
                out.println("<div class=\"col-lg-12\">");
                out.println("<div class=\"alert alert-succes\">");
                out.println("<strong>:), </strong>User creat cu succes.");
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
                rd.include(request, response);
            }
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
