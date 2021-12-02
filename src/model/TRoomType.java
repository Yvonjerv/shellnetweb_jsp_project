package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TRoomType {
    private int typeid;
    private int hotelid;
    private String roomtype;
    private String photourl;
    private int area;
    private String bedtype;
    private String roomserver;
    private String wifi;
    private int personamount;
    private int roomamount;
    private int price;

    public TRoomType() {
    }

    public int getTypeid() {
        return typeid;
    }

    public void setTypeid(int typeid) {
        this.typeid = typeid;
    }

    public int getHotelid() {
        return hotelid;
    }

    public void setHotelid(int hotelid) {
        this.hotelid = hotelid;
    }

    public String getRoomtype() {
        return roomtype;
    }

    public void setRoomtype(String roomtype) {
        this.roomtype = roomtype;
    }

    public String getPhotourl() {
        return photourl;
    }

    public void setPhotourl(String photourl) {
        this.photourl = photourl;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public String getBedtype() {
        return bedtype;
    }

    public void setBedtype(String bedtype) {
        this.bedtype = bedtype;
    }

    public String getRoomserver() {
        return roomserver;
    }

    public void setRoomserver(String roomserver) {
        this.roomserver = roomserver;
    }

    public String getWifi() {
        return wifi;
    }

    public void setWifi(String wifi) {
        this.wifi = wifi;
    }

    public int getPersonamount() {
        return personamount;
    }

    public void setPersonamount(int personamount) {
        this.personamount = personamount;
    }

    public int getRoomamount() {
        return roomamount;
    }

    public void setRoomamount(int roomamount) {
        this.roomamount = roomamount;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }


    public TRoomType(ResultSet rs) {
        try {
            if (rs != null && rs.next()) {
                this.setTypeid(rs.getInt("typeid"));
                this.setHotelid(rs.getInt("hotelid"));
                this.setRoomtype(rs.getString("roomtype"));
                this.setPhotourl(rs.getString("photourl"));
                this.setArea(rs.getInt("area"));
                this.setBedtype(rs.getString("bedtype"));
                this.setRoomserver(rs.getString("roomserver"));
                this.setWifi(rs.getString("wifi"));
                this.setPersonamount(rs.getInt("personamount"));
                this.setRoomamount(rs.getInt("roomamount"));
                this.setPrice(rs.getInt("price"));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public static ArrayList<TRoomType> toList(ResultSet rs) {
        ArrayList<TRoomType> list = new ArrayList<TRoomType>();
        try {
            while (rs != null && rs.next()) {
                TRoomType roomType = new TRoomType();
                roomType.setTypeid(rs.getInt("typeid"));
                roomType.setHotelid(rs.getInt("hotelid"));
                roomType.setRoomtype(rs.getString("roomtype"));
                roomType.setPhotourl(rs.getString("photourl"));
                roomType.setArea(rs.getInt("area"));
                roomType.setBedtype(rs.getString("bedtype"));
                roomType.setRoomserver(rs.getString("roomserver"));
                roomType.setWifi(rs.getString("wifi"));
                roomType.setPersonamount(rs.getInt("personamount"));
                roomType.setRoomamount(rs.getInt("roomamount"));
                roomType.setPrice(rs.getInt("price"));
                list.add(roomType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
}
