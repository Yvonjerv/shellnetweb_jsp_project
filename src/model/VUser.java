package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class VUser {
    private int utid;
    private String userid;
    private String username;
    private String pwd;
    private String mobile;
    private String mail;
    private String companyname;
    private String licencephoto;
    private String createtime;
    private String utname;

    public VUser() {
    }

    public int getUtid() {
        return utid;
    }

    public void setUtid(int utid) {
        this.utid = utid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getCompanyname() {
        return companyname;
    }

    public void setCompanyname(String companyname) {
        this.companyname = companyname;
    }

    public String getLicencephoto() {
        return licencephoto;
    }

    public void setLicencephoto(String licencephoto) {
        this.licencephoto = licencephoto;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getUtname() {
        return utname;
    }

    public void setUtname(String utname) {
        this.utname = utname;
    }


    public VUser(ResultSet rs) {
        try {
            if (rs != null && rs.next()) {
                this.setUserid(rs.getString("userid"));
                this.setUtid(rs.getInt("utid"));
                this.setUsername(rs.getString("username"));
                this.setPwd(rs.getString("pwd"));
                this.setUtid(rs.getInt("utid"));
                this.setMobile(rs.getString("mobile"));
                this.setMail(rs.getString("mail"));
                this.setCompanyname(rs.getString("companyname"));
                this.setLicencephoto(rs.getString("licencephoto"));
                this.setCreatetime(rs.getString("createtime"));
                this.setUtname(rs.getString("utname"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //exchange multiple user data from table to VUser bean
    public static ArrayList<VUser> toList(ResultSet rs) {
        ArrayList<VUser> list = new ArrayList<VUser>();
        try {
            while (rs != null && rs.next()) {
                VUser user = new VUser();
                user.setUserid(rs.getString("userid"));
                user.setUsername(rs.getString("username"));
                user.setPwd(rs.getString("pwd"));
                user.setUtid(rs.getInt("utid"));
                user.setMobile(rs.getString("mobile"));
                user.setMail(rs.getString("mail"));
                user.setCompanyname(rs.getString("companyname"));
                user.setLicencephoto(rs.getString("licencephoto"));
                user.setCreatetime(rs.getString("createtime"));
                user.setUtname(rs.getString("utname"));
                list.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
}