package db;

import javax.xml.transform.Result;
import java.sql.*;

/**
 * Database connection layer implementation
 * @author Yvon Apedo
 * @version 1.0 2021/9/23
 */
public class DBConnection {
    private String driver ="com.mysql.jdbc.Driver";
    private String url ="jdbc:mysql://localhost:3306/shellnetdb?useUnicode=true&characterEncoding=UTF-8";
    private String username ="root";
    private String password="1234";


    /**
     * Create connection from specified database
     * @return connection object Java.sql.Connection
     * @throws Exception
     */
    public Connection getConnection() throws  Exception {
        Class.forName(driver).newInstance();
        return DriverManager.getConnection(url,username,password);

    }

    /**
     * Close database
     * @param con Java.sql.Connection if you don't need to close it input null
     * @param stmt java.sql.Statement
     * @param rs Java.sql.ResultSet
     */
    public void close(Connection con, Statement stmt, ResultSet rs){
        try {
            if(rs !=null) rs.close();
            if(stmt !=null) stmt.close();
            if(con != null) con.close();

        }catch(Exception e) {
            e.printStackTrace();
        }
    }
}
