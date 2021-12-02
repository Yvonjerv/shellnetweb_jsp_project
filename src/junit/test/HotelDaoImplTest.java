package junit.test;

import business.dao.HotelDAO;
import business.dao.UserDAO;
import business.impl.HotelDaoImpl;
import business.impl.UserDaoImpl;
import model.THotel;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

public class HotelDaoImplTest {
    HotelDAO hdao = new HotelDaoImpl();

    @Test
    public void addHotel() {
        THotel hotel = new THotel();
        hotel.setHotelname("Peter's Hotel");
        hotel.setUserid("beike1");
        hotel.setCity("ShangHai");
        hotel.setFeatures("Breakfast");
        System.out.println("success? " + hdao.addHotel(hotel));
    }

    @Test
    public void updateHotel() {
        THotel hotel = hdao.getHotelByid(5);
        hotel.setHotelname("Peter's Hotel");

        hotel.setCity("Kunming");
        hotel.setFeatures("Dinner");
        System.out.println("success? " + hdao.updateHotel(hotel));
    }

    @Test
    public void getHotelByid() {
        THotel hotel = hdao.getHotelByid(1);
        System.out.println(hotel.getHotelid() + " " + hotel.getHotelname());
    }

    @Test
    public void getHotelListByCondition() {
        List<THotel> list = hdao.getHotelListByCondition("Kunming", null);

        for (THotel hotel : list
        ) {
            System.out.println(hotel.getHotelname());
        }

    }

    @Test
    public void getHotelByUser() {
        List<THotel> list = hdao.getHotelByUser("beike1");

        for (THotel hotel : list
        ) {
            System.out.println(hotel.getHotelname());
        }
    }
}