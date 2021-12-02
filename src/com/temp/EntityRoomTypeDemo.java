package com.temp;

import basic.BaseDAO;
import basic.BaseDaoImpl;
import model.TRoomType;

import java.sql.ResultSet;
import java.util.List;

public class EntityRoomTypeDemo {
    public static void main(String args[]) {

        BaseDAO dao = new BaseDaoImpl();
        String sql = "select * from t_roomtype";

        ResultSet rs = dao.select(sql, null);
        List<TRoomType> list = TRoomType.toList(rs);

        for (TRoomType roomType : list) {
            System.out.println(roomType.getBedtype() + "  " + roomType.getRoomtype());
        }

        String sql1 = "select * from t_roomtype where roomtype = 'Courtyard Big Bed Room'";

        ResultSet rs1 = dao.select(sql1, null);
        TRoomType roomType1 = new TRoomType(rs1);
        System.out.println("\n\n" + roomType1.getBedtype() + "  " + roomType1.getRoomtype());
    }
}
