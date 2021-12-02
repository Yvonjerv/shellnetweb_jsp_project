package com.temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class QueryDBDemo {
    public static void  main(String args[]){
        String driver ="com.mysql.jdbc.Driver";
        String url ="jdbc:mysql://localhost:3306/shellnetdb?useUnicode=true&characterEncoding=UTF-8";
        String username ="root";
        String password="1234";
        try{
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, username, password);
            System.out.println("Connect database successfully");

            String sql ="select * from v_user";
            PreparedStatement ptmt = con.prepareStatement(sql);

            ResultSet rs = ptmt.executeQuery();

                    while(rs!=null && rs.next()){
                System.out.print(rs.getObject("userid"));
                System.out.println(", "+rs.getObject("username"));
            }

                    rs.close();
                    ptmt.close();
                    con.close();
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("Connect database failed");
        }
    }
}
