package com.temp;

import basic.BaseDAO;
import basic.BaseDaoImpl;
import model.THotel;

import java.sql.ResultSet;
import java.util.List;

public class EntityHotelDemo {
    public static void main(String args[]) {

        BaseDAO dao = new BaseDaoImpl();
        String sql = "select * from t_hotel";

        ResultSet rs = dao.select(sql, null);
        List<THotel> list = THotel.toList(rs);

        for (THotel hotel : list) {
            System.out.println(hotel.getCountry() + "  " + hotel.getHotelname());
        }

        String sql1 = "select * from t_hotel where hotelname = 'New Palm Inn'";

        ResultSet rs1 = dao.select(sql1, null);
        THotel hotel1 = new THotel(rs1);
        System.out.println("\n\n" + hotel1.getHotelname() + "  " + hotel1.getCountry());
    }
}
