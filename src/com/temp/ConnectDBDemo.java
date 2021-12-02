package com.temp;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDBDemo {

    public static void  main(String args[]){
        String driver ="com.mysql.jdbc.Driver";
        String url ="jdbc:mysql://localhost:3306/shellnetdb?useUnicode=true&characterEncoding=UTF-8";
        String username ="root";
        String password="1234";
        try{
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, username, password);
            System.out.println("Connect database successfully");

        }catch(Exception e){
            e.printStackTrace();
            System.out.println("Connect database failed");
        }
    }
}
