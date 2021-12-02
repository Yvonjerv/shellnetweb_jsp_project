package model;

import business.dao.RoomTypeDAO;
import business.impl.RoomTypeDaoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class THotel {
    private int hotelid;
    private String hotelname;
    private String country;
    private String province;
    private String city;
    private String detailaddr;
    private String features;
    private String server;
    private String photourl;
    private String userid;
    private int cheapestPrice;

    public THotel() {
    }

    public THotel(int hotelid, String hotelname, String country, String province, String city, String detailaddr, String features, String server, String photourl, String userid) {
        this.hotelid = hotelid;
        this.hotelname = hotelname;
        this.country = country;
        this.province = province;
        this.city = city;
        this.detailaddr = detailaddr;
        this.features = features;
        this.server = server;
        this.photourl = photourl;

    }

    public int getCheapestPrice() {
        RoomTypeDAO dao= new RoomTypeDaoImpl();
        return dao.getCheapestPrice(this.hotelid);
    }

    public int getHotelid() {
        return hotelid;
    }

    public void setHotelid(int hotelid) {
        this.hotelid = hotelid;
    }

    public String getHotelname() {
        return hotelname;
    }

    public void setHotelname(String hotelname) {
        this.hotelname = hotelname;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDetailaddr() {
        return detailaddr;
    }

    public void setDetailaddr(String detailaddr) {
        this.detailaddr = detailaddr;
    }

    public String getFeatures() {
        return features;
    }

    public void setFeatures(String features) {
        this.features = features;
    }

    public String getServer() {
        return server;
    }

    public void setServer(String server) {
        this.server = server;
    }

    public String getPhotourl() {
        return photourl;
    }

    public void setPhotourl(String photourl) {
        this.photourl = photourl;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public THotel(ResultSet rs) {
        try {
            if (rs != null && rs.next()) {
                this.setHotelid(rs.getInt("hotelid"));
                this.setHotelname(rs.getString("hotelname"));
                this.setCountry(rs.getString("country"));
                this.setProvince(rs.getString("province"));
                this.setCity(rs.getString("city"));
                this.setDetailaddr(rs.getString("detailaddr"));
                this.setFeatures(rs.getString("features"));
                this.setServer(rs.getString("server"));
                this.setPhotourl(rs.getString("photourl"));
                this.setUserid(rs.getString("userid"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    //exchange multiple user data from table to VUser bean
    public static ArrayList<THotel> toList(ResultSet rs) {
        ArrayList<THotel> list = new ArrayList<THotel>();
        try {
            while (rs != null && rs.next()) {
                THotel hotel = new THotel();
                hotel.setHotelid(rs.getInt("hotelid"));
                hotel.setHotelname(rs.getString("hotelname"));
                hotel.setCountry(rs.getString("country"));
                hotel.setProvince(rs.getString("province"));
                hotel.setCity(rs.getString("city"));
                hotel.setDetailaddr(rs.getString("detailaddr"));
                hotel.setFeatures(rs.getString("features"));
                hotel.setServer(rs.getString("server"));
                hotel.setPhotourl(rs.getString("photourl"));
                hotel.setUserid(rs.getString("userid"));
                list.add(hotel);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
}