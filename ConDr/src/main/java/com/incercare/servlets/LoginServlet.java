package com.incercare.servlets;
import com.connections.OracleConn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OracleConn oracleConn = new OracleConn();
        Connection conn = oracleConn.getConn();

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if(conn!=null)
            try{

                String name=request.getParameter("txtUserName");
                String pass=request.getParameter("txtPass");
                String password="";
                PreparedStatement preparedStatement = conn.prepareStatement("select password from useri where email=?");
                preparedStatement.setString(1, name);

                ResultSet rs = preparedStatement.executeQuery();

                while(rs.next()) {
                    password = rs.getString("password");
                }

                if (!pass.equals(password))
                {//if n ame&pass not match then it display error page//
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.html");
                    out.println("<div class=\"row\">");
                    out.println("<div class=\"col-lg-12\">");
                    out.println("<div class=\"alert alert-warning\">");
                    out.println("<strong>Atentie!</strong> Emailul sau parola sunt gresite.");
                    //   out.println("<font color=red>Either user name or password is wrong.</font>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");
                    rd.include(request, response);
                }
                else{
                    HttpSession session = request.getSession();
                    session.setAttribute("name", name);
                    session.setMaxInactiveInterval(30*60);
                    //setting session to expiry in 30 mins
                    session.setMaxInactiveInterval(30*60);
                    Cookie userName = new Cookie("name", name);
                    userName.setMaxAge(30*60);
                    response.addCookie(userName);
                    response.sendRedirect("categorii.jsp");

                }
                conn.close();

            }catch(SQLException e)
            {
                out.println(e.getMessage());
            }
    }

}