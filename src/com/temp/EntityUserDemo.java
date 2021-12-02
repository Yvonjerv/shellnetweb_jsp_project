package com.temp;

import basic.BaseDAO;
import basic.BaseDaoImpl;
import model.TUser;

import java.sql.ResultSet;
import java.util.List;

public class EntityUserDemo {
    public static void main(String args[]) {

        BaseDAO dao = new BaseDaoImpl();
        String sql = "select * from t_user";

        ResultSet rs = dao.select(sql, null);
        List<TUser> list = TUser.toList(rs);

        for (TUser user : list) {
            System.out.println(user.getUserid() + "  " + user.getUsername());
        }

        String sql1 = "select * from t_user where userid = 'beike1'";

        ResultSet rs1 = dao.select(sql1, null);
        TUser user1 = new TUser(rs1);
        System.out.println("\n\n" + user1.getUserid() + "  " + user1.getUsername());
    }
}
