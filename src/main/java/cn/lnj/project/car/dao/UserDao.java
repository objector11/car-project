package cn.lnj.project.car.dao;


import cn.lnj.project.car.data.User;
import cn.lnj.project.car.util.SaveImages;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户表
 * @author 刘乃杰
 */
@Repository
public interface UserDao {

    /**
     * 新建用户
     * @param user 用户的javaBean
     */
    void insert(User user);

    /**
     * 查询全部用户
     * @return 全部用户的javaBean
     */
    List<User> selectAllUser();

    /**
     * 根据id查询用户
     * @param userId 用户的id
     * @return 一个用户的javaBean
     */
    User selectById(String userId);


    /**
     * 查询用户账号是否存在且激活
     * @param userCount 用户账号
     * @return 该用户的JavaBean
     */
    User selectCount(String userCount);

    /**
     * 查询用户邮箱是否注册
     * @param emailAddress 用户邮箱地址
     * @return 该用户的JavaBean
     */
    User selectEmail(String emailAddress);

    /**
     * 查询用户名称是否存在
     * @param userName 用户名
     * @return 该用户的JavaBean
     */
    User selectName(String userName);

    /**
     * 根据用户id查询用户名称
     * @param userId 用户id
     * @return
     */
    String selectNameById(String userId);

    /**
     * 查询密码
     * @param userCount 用户账号
     * @return 用户密码
     */
    String selectPassword(String userCount);

    /**
     * 检查用户是否为管理员或超级管理员
     * @param userCount 用户登录账号
     * @return
     */
    User checkAdmin(String userCount);

    /**
     * 输入框自动提示
     * @param keyword
     * @return
     */
    List<User> auto(String keyword);

    /**
     * 设置管理员
     * @param userId 用户id
     */
    void setAdmin(String userId);

    /**
     *  更新用户，一次只能更新一个参数。并且传入userId
     * @param user 用户
     */
    void updateUser(User user);

    /**
     * 删除管理员
     * @param userId 用户id
     */
    void deleteAdmin(String userId);
}
