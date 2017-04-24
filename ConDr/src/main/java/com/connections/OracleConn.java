package com.connections;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by Alex on 10-Apr-17.
 */
public class OracleConn {

    public Connection getConn(){
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
        }catch (ClassNotFoundException e){
            System.out.println("OracleDriver not found");
            e.printStackTrace();
            return null;
        }
        Connection connection=null;

        try{
            connection= DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:XE","student","STUDENT");


        }catch(SQLException e){
            System.out.println("Connection Failed! Check output console");
            e.printStackTrace();
            return null;
        }
        if(connection!=null){
            System.out.println("Connection SUCCES");
            return connection;
        }else {
            System.out.println("Connection Failed");
            return null;
        }
    }
}
