package com.temp;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.concurrent.Callable;

public class CallProcedureDemo {

    public static void  main(String args[]){
        String driver ="com.mysql.jdbc.Driver";
        String url ="jdbc:mysql://localhost:3306/shellnetdb?useUnicode=true&characterEncoding=UTF-8";
        String username ="root";
        String password="1234";
        try{
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, username, password);
            System.out.println("Connect database successfully");

            String proc = "up_getsystime";

            CallableStatement ctmt = con.prepareCall("{call "+proc+"}");
            ctmt.execute();
            ResultSet rs;
            boolean row = ctmt.execute();
            if(row) {// row == true represent successful
                rs = ctmt.getResultSet();

                while (rs != null && rs.next()) {
                    System.out.println(rs.getObject(1));
                }
                rs.close();
            }
            ctmt.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("Connect database failed");
        }
    }
}
