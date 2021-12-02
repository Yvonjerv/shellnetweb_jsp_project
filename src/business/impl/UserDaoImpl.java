package business.impl;

import basic.BaseDAO;
import basic.BaseDaoImpl;
import business.dao.UserDAO;
import model.TUser;
import model.VUser;

import java.sql.ResultSet;

public class UserDaoImpl implements UserDAO {
    //we need to process Database by data Access layer
    private BaseDAO dao = new BaseDaoImpl();

    @Override
    public VUser login(String userid, String pwd) {

        String sql = "select * from v_user where userid = ? and pwd=?";
        Object[] para = {userid, pwd};
        ResultSet rs = dao.select(sql, para);
        VUser user = new VUser(rs);
        dao.close();
        return user;
    }

    @Override
    public boolean isUseridValid(String userid) {
        String sql = "select * from t_user where userid=?";

        Object[] para = {userid};
        int row = dao.selectCount(sql, para);
        if (row > 0) return false;
        else return true;
    }


    @Override
    public boolean registerUser(TUser user) {
        String sql = "insert into t_user (userid,username,pwd,utid," +
                "mobile,mail,companyname,licencephoto) " +
                "values(?,?,?,?,?,?,?,?)";

        Object[] para = {user.getUserid(), user.getUsername(), user.getPwd(), user.getUtid(), user.getMobile(), user.getMail(), user.getCompanyname(), user.getLicencephoto()};
        int row = dao.insert(sql, para);
        if (row > 0) return true;
        else return false;
    }

    @Override
    public boolean modifyUser(TUser user) {
        String sql = "update t_user set username  =? ,pwd  =? ,mobile =? ," +
                "mail =? ,companyname =? ,licencephoto =?  " +
                "where userid=?";
        Object[] para = {user.getUsername(), user.getPwd(), user.getMobile(),
                user.getMail(), user.getCompanyname(), user.getLicencephoto(),
                user.getUserid()};
        return dao.update(sql, para);

    }

    @Override
    public TUser getTUserById(String userid) {
        String sql = "select * from t_user where userid=? ";
        Object[] para = {userid};
        ResultSet rs = dao.select(sql, para);
        TUser user = new TUser(rs);
        dao.close();
        return user;
    }

    @Override
    public VUser getVUserById(String userid) {
        String sql = "select * from v_user where userid=? ";
        Object[] para = {userid};
        ResultSet rs = dao.select(sql, para);
        VUser user = new VUser(rs);
        dao.close();
        return user;
    }

    @Override
    public boolean isHotelUser(String userid) {
        String sql = "select * from t_user where userid = ? and utid = ?";
        Object[] para = {userid, 1};
        int row = dao.selectCount(sql, para);
        if (row > 0) return true;
        else return false;
    }
}
