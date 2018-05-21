package cn.lnj.project.car.service;

import cn.lnj.project.car.data.User;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.List;
import java.util.Map;

/**
 * 用户表的服务层
 * @author 刘乃杰
 */
public interface UserService {

    void insertUser(User user);

    /**
     * 查询全部用户
     * @return 全部用户的javaBean
     */
    List<User> selectAllUser();

    /**
     * 根据id查询用户
     */
    JSONObject selectById(String userId);

    /**
     *  根据id查询用户名
     * @param userId 用户id
     * @return 用户名
     */
    String selectNameById(String userId);

    /**
     * 登录、注册检查
     * 前台表单的name值不同，可据此改变查询条件，也可改变返回内容
     * @param name 表单name值
     * @param param 表单输入值
     * @return 校验结果和显示文字
     */
    JSONObject check(String name,String param);

    /**
     * 校验密码
     * @param userName 用户名
     * @param password 输入密码
     * @return validform校验格式的json
     */
    JSONObject checkPassword(String userName,String password);

    /**
     * 通过邮箱激活账户
     * @param userId 用户id
     */
    JSONObject activeCount(String userId);

    /**
     * 登录时，检查用户等级
     * @param userCount 用户账号
     * @return 0 用户，1 管理员，2 超级管理员
     */
    JSONObject checkAdmin(String userCount);

    /**
     * 根据用户id查询用户
     * @param userId 用户id
     * @return
     */
    User selectUser(String userId);


    JSONArray autoComplete(String keyword);

    /**
     * 设置管理员
     * @param userCount 用户账号
     * @param shopName 商家名称
     * @return
     */
    JSONObject setAdmin(String userCount,String shopName);

    /**
     * 根据用户id查询商家名称
     * @param userId 用户id
     * @return
     */
    String selectShopNameByUserId(String userId);

    /**
     * 更新用户头像
     * @param imageName 头像在images文件夹下的名称
     * @param userId 用户id
     */
    void updateImage(String imageName,String userId);

    /**
     * 删除管理员
     * @param userId 用户id
     */
    void deleteAdmin(String userId);

    void updatePassword(String userId,String newPassword);

    void updateUser(User user);
}
