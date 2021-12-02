package business.dao;

import model.TRoomType;

import java.util.List;

/**
 *  hotel room type management business  interface
 */
public interface RoomTypeDAO {
    /**
     * 添Add a hotel room type
     * @param room, Object of TRoomType
     * @return Return true for success and false for failure
     */
    public boolean addHotelRoomType(TRoomType room);

    /**
     * Modify room type information
     * @param room,Object of TRoomType
     * @return Return true for success and false for failure
     */
    public boolean updateHotelRoomType(TRoomType room);

    /**
     * Delete hotel room type information
     * @param roomid  Room type ID to delete
     * @return Return true for success and false for failure
     */
    public boolean deleteHotelRoomType(int roomid);

    /**
     * Query room type according to room type number
     * @param roomid Query the room type according to the room type number
     * @return The thotelroom object is returned successfully,
     * and null is returned if it fails
     */
    public TRoomType getRoomTypeById(int roomid);

    /**
     * Return all room type information of a hotel
     * @param hotelid Hotel number of a hotel
     * @return List<TRoomType>
     */
    public List<TRoomType> getRoomTypeListByHotelid(int hotelid);

    /**
     * Get the price of the cheapest hotel room in a hotel
     * @param hotelid
     * @return int Return the price of the cheapest hotel room
     */
    public int getCheapestPrice(int hotelid);
}
