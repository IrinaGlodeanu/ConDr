package com.incercare.servlets;
import com.connections.OracleConn;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)   //16 mb
public class FileUploadDBServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
      
        String id_user1 = request.getParameter("id_user");
        int id_user = Integer.parseInt(id_user1);

        InputStream inputStream = null; // input stream

        // obtine fisier uploadat din profil.jsp
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // obtinem input streamul
            inputStream = filePart.getInputStream();
        }

        Connection conn = null; 
        String message = null;  

        Random number =new Random();
        int randomNum=number.nextInt(100);

        try {
            // ne conectam
            OracleConn oracleConn = new OracleConn();
            conn = oracleConn.getConn();

            // construim statementul
            String sql = "UPDATE useri set path=? where userid=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(2, id_user);

            if (inputStream != null) {
                // luam input stream pentru blob
                statement.setBlob(1, inputStream);
            }

            // updatam baza de date
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
              
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
           
            request.setAttribute("Message", randomNum);

            // trimitem mesajul
            getServletContext().getRequestDispatcher("/profil.jsp").forward(request, response);
        }
    }
}