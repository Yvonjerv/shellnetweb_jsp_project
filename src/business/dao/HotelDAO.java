package business.dao;

import model.THotel;

import java.util.List;

/**
 * hotel management business  interface
 */
public interface HotelDAO {
    /**
     * add new hotel in t_hotel,
	 * @param hotel, Object of THotel entity class
	 * @return boolean,return hotel id when success, otherwise return 0
     *
	 */
    public int addHotel(THotel hotel);

    /**
     * modify hotel information
     * @param hotel Object of THotel entity class
     * @return boolean, return true when success, otherwise false
     */
    public boolean updateHotel(THotel hotel);

    /**
     * Return the matching Hotel object according to the hotelid
     * @param hotelid
     * @return THotel, return null when find fail
     */
    public THotel getHotelByid(int hotelid);

    /**
     * Returns a list of objects for all hotel information
     * @return List<THotel>
     */
    public List<THotel> getHotelListByCondition(String position, String hotelname);

    /**
     * 获Get all hotels managed by the specified user
     * @param userid
     * @return List<THotel>
     */
    public List<THotel> getHotelByUser(String userid);

}
