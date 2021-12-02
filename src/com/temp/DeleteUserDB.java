package com.temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class DeleteUserDB {
    public static void  main(String args[]) {

        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/shellnetdb?useUnicode=true&characterEncoding=UTF-8";
        String username = "root";
        String password = "1234";
        try {
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, username, password);

//delete
            String userid;
            Scanner input = new Scanner(System.in);

            System.out.println("please input the userid you would like to delete");
            userid = input.nextLine();


            String sql = "delete from t_user where userid=? " ;


            PreparedStatement ptmt = con.prepareStatement(sql);
            //set real value to placeholder
            ptmt.setObject(1, userid);

            int row = ptmt.executeUpdate();
            System.out.println("deleted row " + row);
            ptmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Connect database failed");
        }
    }
    }
