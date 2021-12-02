package com.temp;

import basic.BaseDAO;
import basic.BaseDaoImpl;
import model.VUser;

import java.sql.ResultSet;
import java.util.List;

public class EntityViewUserDemo {
    public static void main(String args[]) {

        BaseDAO dao = new BaseDaoImpl();
        String sql = "select * from v_user";

        ResultSet rs = dao.select(sql, null);
        List<VUser> list = VUser.toList(rs);

        for (VUser user : list) {
            System.out.println(user.getUserid() + "  " + user.getUsername());
        }

        String sql1 = "select * from v_user where userid = 'beike1'";

        ResultSet rs1 = dao.select(sql1, null);
        VUser user1 = new VUser(rs1);
        System.out.println("\n\n" + user1.getUserid() + "  " + user1.getUsername());
    }
}
