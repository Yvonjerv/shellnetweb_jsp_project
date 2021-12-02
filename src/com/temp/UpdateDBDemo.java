package com.temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class UpdateDBDemo {

    public static void main(String args[]) {

        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/shellnetdb?useUnicode=true&characterEncoding=UTF-8";
        String username = "root";
        String password = "1234";
        try {
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, username, password);

//Update
            String userid, mobile, pwd;
            Scanner input = new Scanner(System.in);

            System.out.println("please input your current userid");
            userid = input.nextLine();
            System.out.println("please input new mobile");
            mobile = input.nextLine();
            System.out.println("please input new password");
            pwd = input.nextLine();

            String sql = "update t_user set mobile=? and  pwd=? " +
                    " where userid=?";

            PreparedStatement ptmt = con.prepareStatement(sql);
            //set real value to placeholder
            ptmt.setObject(1, mobile);
            ptmt.setObject(2, pwd);
            ptmt.setObject(3, userid);

            int row = ptmt.executeUpdate();
            System.out.println("updated row " + row);
            ptmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Connect database failed");
        }
    }
}