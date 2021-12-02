package junit.test;

import business.dao.UserDAO;
import business.impl.UserDaoImpl;
import model.TUser;
import model.VUser;
import org.junit.Test;

import static org.junit.Assert.*;

public class UserDaoImplTest {
UserDAO udao = new UserDaoImpl();

    @Test
    public void login() {
        VUser user = udao.login("beike1","000000");
        if (user ==null || user.getUserid()==null){
            System.out.println("login failed WRONG INFO");
        }else{
            System.out.println(user.getUserid()+"  "+user.getUsername());
        }
    }

    @Test
    public void isUseridValid() {

        System.out.println("beike1 is available "+udao.isUseridValid("beike1"));
    }

    @Test
    public void registerUser() {
        TUser user = new TUser();
        user.setUserid("peter1");
        user.setUsername("peter Williams");
        user.setPwd("pwd");
        user.setUtid(2);
        System.out.println("Success: "+ udao.registerUser(user));
    }

    @Test
    public void modifyUser() {

    }

    @Test
    public void getTUserById() {
        TUser user =udao.getTUserById("beike1");
        System.out.println(user.getUsername()+" "+user.getMobile());
    }

    @Test
    public void getVUserById() {
        VUser user =udao.getVUserById("beike1");
        System.out.println(user.getUsername()+" "+user.getMobile());
    }

    @Test
    public void isHotelUser() {
        System.out.println("Is Hotel administrator ?"+ udao.isHotelUser("beike1"));
        System.out.println("Is Hotel administrator ?"+ udao.isHotelUser("Stark01"));
    }
}