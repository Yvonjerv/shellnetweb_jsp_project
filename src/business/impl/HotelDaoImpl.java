package business.impl;

import basic.BaseDAO;
import basic.BaseDaoImpl;
import business.dao.HotelDAO;
import model.THotel;

import java.sql.ResultSet;
import java.util.List;

public class HotelDaoImpl implements HotelDAO {
    //we need to process Database by data Access layer
    private BaseDAO dao = new BaseDaoImpl();

    @Override
    public int addHotel(THotel hotel) {
        String sql = "insert into t_hotel( hotelname,country,province,city," +
                "detailaddr,features,server,photourl,userid) " +
                "values(?,?,?,?,?,?,?,?,?)";
        Object[] para = {hotel.getHotelname(), hotel.getCountry(), hotel.getProvince(), hotel.getCity(), hotel.getDetailaddr(),
                hotel.getFeatures(), hotel.getServer(), hotel.getPhotourl(), hotel.getUserid()};

        return dao.insert(sql, para);
    }

    @Override
    public boolean updateHotel(THotel hotel) {
        String sql = "update t_hotel set hotelname=? ,country=? ,province=? ,city=? ," +
                "detailaddr=? ,features=? ,server=? ,photourl=?" +
                " where hotelid=?";
        Object[] para = {hotel.getHotelname(), hotel.getCountry(), hotel.getProvince(), hotel.getCity(),
                hotel.getDetailaddr(), hotel.getFeatures(), hotel.getServer(), hotel.getPhotourl(), hotel.getHotelid()};

        return dao.update(sql, para);
    }

    @Override
    public THotel getHotelByid(int hotelid) {
        String sql = "select * from t_hotel where hotelid=?";
        Object[] para = {hotelid};
        ResultSet rs = dao.select(sql, para);
        THotel hotel = new THotel(rs);
        dao.close();
        return hotel;
    }

    @Override
    public List<THotel> getHotelListByCondition(String position, String hotelname) {
        if (position == null && hotelname == null) {
            String sql = "select * from t_hotel order by hotelid desc ";

            ResultSet rs = dao.select(sql, null);
            List<THotel> list = THotel.toList(rs);
            dao.close();
            return list;
        } else {
            String sql = "select * from t_hotel where ";
            String whereString = "";
            if (position != null) {
                whereString += "(city like '%" +position+"%' "+
                        "or detailaddr like '%"+position+"%')";
            }
            if (hotelname !=null){
                if (whereString.equals("")){
                    whereString+="hotelname like '%"+hotelname+"%'" ;
                }else{
                    whereString+="and hotelname like '%"+hotelname+"%'";
                }
            }
            sql +=whereString;
            ResultSet rs = dao.select(sql, null);
            List<THotel> list= THotel.toList(rs);
            dao.close();
            return list;
        }

    }

    @Override
    public List<THotel> getHotelByUser(String userid) {
        String sql = "select * from t_hotel where userid=?";

        Object[] para = {userid};
        ResultSet rs = dao.select(sql, para);
        List<THotel> list = THotel.toList(rs);

        return list;
    }
}
