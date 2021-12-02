package com.temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Scanner;

//review how to insert data into table with jdbc technology
public class InsertDBDemo {
    public static void  main(String args[]) {

        String driver ="com.mysql.jdbc.Driver";
        String url ="jdbc:mysql://localhost:3306/shellnetdb?useUnicode=true&characterEncoding=UTF-8";
        String username ="root";
        String password="1234";
        try{
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, username, password);

//insert
            String userid, userName, pwd;
            Scanner input = new Scanner(System.in);

            System.out.println("please input new userid");
            userid= input.nextLine();
            System.out.println("please input new username");
            userName= input.nextLine();
            System.out.println("please input new password");
            pwd= input.nextLine();

            String sql="insert into t_user(userid,username,pwd,utid) " +
                    "values(?,?,?,1)";


            PreparedStatement ptmt= con.prepareStatement(sql) ;
            //set real value to placeholder
            ptmt.setObject(1,userid);
            ptmt.setObject(2,userName);
            ptmt.setObject(3,pwd);

            int row=ptmt.executeUpdate();
            System.out.println("insert row "+ row);
            ptmt.close();
            con.close();

        }catch(Exception e){
            e.printStackTrace();
            System.out.println("Connect database failed");
        }

    }
}
