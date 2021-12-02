package junit.test;

import basic.BaseDAO;
import basic.BaseDaoImpl;
import org.junit.Before;
import org.junit.Test;

import java.sql.ResultSet;
import java.sql.SQLException;


public class BaseDaoImplTest extends BaseDaoImpl {

    BaseDAO dao = null;
    @Before
    public void init(){
        dao=  new BaseDaoImpl();
    }

    @Test
    public void testInsert() {
        String sql ="insert into t_hotel(hotelname,userid ) " +
                "values(?,?)";
        Object[] para={"Songmin District Hotel","beike1"};
        int key =dao.insert(sql, para);
        System.out.println("primary key of new hotel is "+key);
    }

    @Test
    public void testUpdate() {
        String sql="update t_hotel set country=?, province=?, city=? " +
                "where hotelid=?";
        Object[] para={"China","Yunnan", "SongMin", 4};
        boolean flag= dao.update(sql,para);
        System.out.println("Update successful "+flag);
    }

    @Test
    public void testDelete() {
        String sql = "delete from t_hotel "+
                "where hotelid=?";
        Object[] para = {4};
        boolean flag = dao.update(sql,para);
        System.out.println("delete table successfully "+flag);
    }

    @Test
    public void testSelect() throws SQLException {
        String sql = "select * from t_hotel " +
                "where city like ?";
        Object[] para = {"%Kun%"};
        ResultSet rs = dao.select(sql, para);

        while (rs!= null && rs.next()){
            System.out.println(rs.getObject("hotelname")+" .... "+ rs.getObject("city"));
        }
   dao.close();
    }

    @Test
    public void testSelectCount() {
        String sql = "select * from t_hotel";
        int count = dao.selectCount(sql, null);
        System.out.println("count of hotel in t_hotel is "+count);
    }

    @Test
    public void testCallProcedureWithQuery() throws SQLException {
        String proc = "up_getsystime";
        ResultSet rs = dao.callProcedureWithQuery(proc, null);
                while(rs!=null && rs.next()){
                    System.out.println("current time is "+ rs.getObject(1));
                }

    }
}