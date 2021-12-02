package business.impl;

import basic.BaseDAO;
import basic.BaseDaoImpl;
import business.dao.RoomTypeDAO;
import model.TRoomType;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class RoomTypeDaoImpl implements RoomTypeDAO {
    //we need to process Database by data Access layer
    private BaseDAO dao = new BaseDaoImpl();


    @Override
    public boolean addHotelRoomType(TRoomType room) {
        String sql = "insert into t_RoomType(hotelid,roomtype,photourl,area,bedtype,roomserver,wifi" +
                ",personamount,roomamount,price) values(?,?,?,?,?,?,?,?,?,?)";
        Object[] para = {room.getHotelid(), room.getRoomtype(), room.getPhotourl(), room.getArea(), room.getBedtype(), room.getRoomserver(),
                room.getWifi(), room.getPersonamount(), room.getRoomamount(), room.getPrice()};
        int row = dao.insert(sql, para);
        if (row > 0) return true;
        else return false;
    }

    @Override
    public boolean updateHotelRoomType(TRoomType room) {
        String sql = "update t_Roomtype set roomtype=? ,photourl=? ,area=? ,bedtype=? ,roomserver=? ,wifi=? , " +
                "personamount=? ,roomamount=? ,price=? " +
                "where hotelid=?";
        Object[] para = {room.getRoomtype(), room.getPhotourl(), room.getArea(), room.getBedtype(), room.getRoomserver(),
                room.getWifi(), room.getPersonamount(), room.getRoomamount(), room.getPrice(), room.getHotelid()};

        return dao.update(sql, para);
    }

    @Override
    public boolean deleteHotelRoomType(int roomid) {
        String sql = "delete from t_roomType where typeid=?";
        Object[] para = {roomid};

        return dao.delete(sql, para);
    }

    @Override
    public TRoomType getRoomTypeById(int roomid) {
        String sql = "select * from t_roomType where typeid=?";
        Object[] para = {roomid};
        ResultSet rs = dao.select(sql, para);
        TRoomType roomType = new TRoomType(rs);
        dao.close();
        return roomType;
    }

    @Override
    public List<TRoomType> getRoomTypeListByHotelid(int hotelid) {
        String sql = "select * from t_roomtype where hotelid=?";
        Object[] para = {hotelid};
        ResultSet rs = dao.select(sql, para);
        List<TRoomType> list = TRoomType.toList(rs);
        dao.close();
        return list;
    }

    @Override
    public int getCheapestPrice(int hotelid) {
        int minprice = 0;

        String sql = "select min(price) from t_roomtype where hotelid=?";
        Object[] para = {hotelid};
        ResultSet rs = dao.select(sql, para);
        try {
            if (rs != null && rs.next()) {
                minprice = rs.getInt(1);

            }
            dao.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return minprice;
    }
}
