package cn.lnj.project.car.data;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 用户表的实体类
 * @author 刘乃杰
 */
@Table(name = "user")
public class User {
    /**
     * 用户id uuid随机生成
     */
    @Id
    private String userId;

    /**
     * 用户登录账号，邮箱或者手机号
     */
    @Column(name="user_count")
    private String userCount;

    /**
     * 用户昵称
     */
    @Column(name="user_name")
    private String userName;

    /**
     * 用户邮箱
     */
    @Column(name="user_email")
    private String userEmail;


    /**
     * 账号密码
     */
    @Column(name="user_password")
    private String userPassword;

    /**
     * 用户注册时间
     */
    @Column(name="user_registration")
    private String userRegistration;

    /**
     * 用户是否激活
     */
    @Column(name="is_active")
    private int isActive;

    /**
     * 用户租车次数
     */
    @Column(name="rent_count")
    private int rentCount;

    /**
     * 用户头像
     */
    @Column(name="user_image")
    private String userImage;

    @Column(name = "is_admin")
    private int isAdmin;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserCount() {
        return userCount;
    }

    public void setUserCount(String userCount) {
        this.userCount = userCount;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserRegistration() {
        return userRegistration;
    }

    public void setUserRegistration(String userRegistration) {
        this.userRegistration = userRegistration;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    public int getRentCount() {
        return rentCount;
    }

    public void setRentCount(int rentCount) {
        this.rentCount = rentCount;
    }

    public String getUserImage() {
        return userImage;
    }

    public void setUserImage(String userImage) {
        this.userImage = userImage;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

}
