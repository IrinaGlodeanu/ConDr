package com.incercare.servlets;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

/**
 * Created by Alex on 07-Jun-17.
 */
@WebServlet("/populareDinAPI")
public class populareDinAPI extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        for(int j=10;j<=30;j++) {
            String rezultat = "";
            String sURL = "http://www.recipepuppy.com/api/?p="+j; //just a string
            BufferedReader reader = null;
            try {
                URL url = new URL(sURL);
                reader = new BufferedReader(new InputStreamReader(url.openStream()));
                StringBuffer buffer = new StringBuffer();
                int read;
                char[] chars = new char[1024];
                while ((read = reader.read(chars)) != -1)
                    buffer.append(chars, 0, read);
                rezultat = buffer.toString();
            } finally {
                if (reader != null)
                    reader.close();
            }


            // Convert to a JSON object to print data
            JSONObject obj = new JSONObject(rezultat);
            // String pageName = obj.getJSONObject("pageInfo").getString("pageName");

            JSONArray arr = obj.getJSONArray("results");
            for (int i = 0; i < arr.length(); i++) {
                String post_id = arr.getJSONObject(i).getString("title");
                System.out.println(post_id);
            }
        }



    }
}
