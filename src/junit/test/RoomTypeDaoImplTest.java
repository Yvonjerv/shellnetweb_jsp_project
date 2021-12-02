package junit.test;

import business.impl.RoomTypeDaoImpl;
import model.TRoomType;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

public class RoomTypeDaoImplTest {
RoomTypeDaoImpl rdao= new RoomTypeDaoImpl();
    @Test
    public void addHotelRoomType() {
        TRoomType roomType= new TRoomType();
        roomType.setRoomtype("Business Standard room");
        roomType.setHotelid(5);
        roomType.setBedtype("Single");
        roomType.setArea(32);
        System.out.println(rdao.addHotelRoomType(roomType));
    }

    @Test
    public void updateHotelRoomType() {
        TRoomType room= rdao.getRoomTypeById(9);
        room.setArea(44);
        System.out.println(rdao.updateHotelRoomType(room));
    }

    @Test
    public void deleteHotelRoomType() {
        System.out.println(rdao.deleteHotelRoomType(9));
    }

    @Test
    public void getRoomTypeById() {
        TRoomType room= rdao.getRoomTypeById(9);
        System.out.println(room.getBedtype());
    }

    @Test
    public void getRoomTypeListByHotelid() {
        List<TRoomType> list= rdao.getRoomTypeListByHotelid(1);
        for (TRoomType room: list
        ) {
            System.out.println(room.getRoomtype());
        }
    }

    @Test
    public void getCheapestPrice() {
        int cheapPrice = rdao.getCheapestPrice(1);
        System.out.println(cheapPrice);
    }
}