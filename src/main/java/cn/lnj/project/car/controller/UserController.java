package cn.lnj.project.car.controller;

import cn.lnj.project.car.data.User;
import cn.lnj.project.car.service.AdminService;
import cn.lnj.project.car.service.UserService;
import cn.lnj.project.car.util.SaveImages;
import cn.lnj.project.car.util.SendMail;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * 用户的控制层
 * @author 刘乃杰
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private SendMail sendMail;
    @Autowired
    private SaveImages saveImages;
    @Autowired
    private AdminService adminService;

    /**
     *  新建用户
     * @param email 邮箱
     * @param userName 用户昵称
     * @param userPassword 用户密码
     * @param response
     */
    @RequestMapping(value = "/insert" , method = RequestMethod.POST )
    @ResponseBody()
    public void insert(@RequestParam String email, String userName, String userPassword, HttpServletResponse response){
        if( !("".equals(email))&& !("".equals(userName)) && !("".equals(userPassword)) ){
            User user = new User();
            user.setUserId(UUID.randomUUID().toString());
            user.setUserCount(email);
            user.setUserName(userName);
            user.setUserEmail(email);
            user.setUserPassword(userPassword);
            Date currentTime = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String dateString = formatter.format(currentTime);
            user.setUserRegistration(dateString);
            user.setUserImage("default.png");
            userService.insertUser(user);
            sendMail.active(email,user.getUserId());
        }
    }

    /**
     * 查询全部用户
     * @return 全部用户的javaBean
     */
    @RequestMapping(value = "/all" , method = RequestMethod.GET)
    @ResponseBody()
    public List<User> selectAllUser(){
        return userService.selectAllUser();
    }


    /**
     * 根据id查询用户
     * @param userId 用户的id
     * @return 一个用户的javaBean
     */
    @RequestMapping(value = "/id", method = RequestMethod.GET)
    @ResponseBody()
    public JSONObject selectUserById(@RequestParam String userId){
        return  userService.selectById(userId);
    }

    /**
     * 登录、注册检查
     * 前台表单的name值不同，可据此改变查询条件，也可改变返回内容
     * @param name 表单name值
     * @param param 表单输入值
     * @return 校验结果和显示文字
     */
    @RequestMapping( value = "/check",method = RequestMethod.GET)
    @ResponseBody()
    public JSONObject loginRegistCheck(@RequestParam String name,String param){
        return userService.check(name,param);
    }

    /**
     * 登录时密码校验
     * @param userCount 用户登录账号
     * @param password 用户密码
     * @return
     */
    @RequestMapping( value = "/checkPassword",method = RequestMethod.GET)
    @ResponseBody()
    public JSONObject checkPassword(@RequestParam String userCount,String password){
        return userService.checkPassword(userCount,password);
    }

    /**
     * 用户通过邮件激活账户
     * @param userId 用户id
     */
    @RequestMapping(value = "/active",method = RequestMethod.GET)
    @ResponseBody()
    public JSONObject activeCount(@RequestParam String userId){
        return userService.activeCount(userId);
    }


    /**
     * 登录时检查用户等级，分别跳转到不同页面
     * @param userCount 用户账号
     * @return level 用户等级 0 用户，1 管理员，2 超级管理员
     *  当为管理员时 还返还 该管理员所在商家的信息
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject login(@RequestParam String userCount){
        return userService.checkAdmin(userCount);
    }

    /**
     * 用户更新密码
     * @param userId 用户id
     * @param userPassword 新密码
      */
    @RequestMapping(value = "/updatePassword",method = RequestMethod.POST)
    @ResponseBody
    public void updatePassword(@RequestParam String userId,String userPassword){
        userService.updatePassword(userId,userPassword);
    }

    @RequestMapping(value = "/updateName",method = RequestMethod.GET)
    @ResponseBody
    public void updateUserName(@RequestParam String userId,String userName){
        User user=new User();
        user.setUserId(userId);
        user.setUserName(userName);
        userService.updateUser(user);
    }

    /**
     * 输入框自动提示
     * @param keyword 输入的关键字
     * @return
     */
    @RequestMapping(value = "/autoComplete",method = RequestMethod.GET)
    @ResponseBody
    public JSONArray autoComplete(@RequestParam String keyword){
        return userService.autoComplete(keyword);
    }

    /**
     * 设置管理员
     * @param userCount 用户账号
     * @param shopName 商家名称
     * @return
     */
    @RequestMapping(value = "/setAdmin",method = RequestMethod.GET)
    @ResponseBody
    public JSONObject setAdmin(@RequestParam String userCount,String shopName){
        return userService.setAdmin(userCount,shopName);
    }

    /**
     *  根据用户id查询商家名称
     * @param userId 用户id
     * @return
     */
    @RequestMapping(value = "/selectShopNameByUserId",method = RequestMethod.GET,produces="text/html;charset=UTF-8;")
    @ResponseBody
    public String selectShopNameByUserId(@RequestParam String userId){
       return userService.selectShopNameByUserId(userId);
    }

    /**
     *  用户更换头像
     * @param userImage 用户头像
     * @param userId 用户id
     * @param request
     * @return
     */
    @RequestMapping(value = "saveUserImage",method = RequestMethod.POST,produces="text/html;charset=UTF-8;")
    @ResponseBody
    public String saveUserImage(@RequestParam("userImage") MultipartFile userImage,@RequestParam("userId") String userId, HttpServletRequest request){
        String imageName = UUID.randomUUID().toString();
        saveImages.saveImage(userImage,imageName,request);
        userService.updateImage(imageName+".png",userId);
        return imageName+".png";
    }

    /**
     * 删除管理员
     * @param ids 用户id，通过“，”拼接
     */
    @RequestMapping(value = "delete",method = RequestMethod.GET)
    @ResponseBody
    public void deleteAdmin(@RequestParam String ids){
        String[] id = ids.split(",");
        for (String content:id) {
            userService.deleteAdmin(content);
            adminService.deleteAdmin(content);
        }
    }
}
