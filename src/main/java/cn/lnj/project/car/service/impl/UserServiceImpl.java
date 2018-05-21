package cn.lnj.project.car.service.impl;

import cn.lnj.project.car.dao.*;
import cn.lnj.project.car.data.*;
import cn.lnj.project.car.service.ShopService;
import cn.lnj.project.car.service.UserService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;


/**
 * 用户表的服务层的实现类
 * @author 刘乃杰
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;
    @Autowired
    private CarDao carDao;
    @Autowired
    private ShopDao shopDao;
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private AdminDao adminDao;


    @Override
    public void insertUser(User user) {
        userDao.insert(user);
    }

    @Override
    public List<User> selectAllUser() {
        return userDao.selectAllUser();
    }


    @Override
    public JSONObject selectById(String userId) {
        JSONObject result=new JSONObject();
        //存放基本信息
        JSONObject baseInfo = new JSONObject();
        User user =  userDao.selectById(userId);
        baseInfo.put("userCount",user.getUserCount());
        baseInfo.put("userName",user.getUserName());
        baseInfo.put("userEmail",user.getUserEmail());
        baseInfo.put("userRegistration",user.getUserRegistration());
        baseInfo.put("rentCount",user.getRentCount());
        baseInfo.put("userImage",user.getUserImage());

        List<Order> orderList =  orderDao.selectByUserId(userId);

        //如果有租赁记录，则添加信息
        if(orderList.size()>0){
            JSONArray orders=new JSONArray();
            for (Order content:orderList) {
                JSONObject order = new JSONObject();
                //还需要根据车辆id和商家id查询出车辆名称，商家名称等信息
                order.put("carId",content.getCarId());
                Car car = carDao.selectById(content.getCarId());
                order.put("carName",car.getCarName());
                order.put("carBrand",car.getCarBrand());
                order.put("shopId",content.getShopId());
                Shop shop = shopDao.selectById(content.getShopId());
                order.put("shopName",shop.getShopName());
                order.put("orderTime",content.getOrderTime());

                orders.add(order);
            }
            result.put("orders",orders);
        }

        //管理员所上传的车辆
        if(1 == user.getIsAdmin()){

            JSONArray carList = new JSONArray();
            List<Car> list = carDao.selectByUserId(userId);
            for (Car content:list) {
                if(content!=null){
                    JSONObject carInfo =new JSONObject();
                    carInfo.put("carId",content.getCarId());
                    carInfo.put("carBrand",content.getCarBrand());
                    carInfo.put("carName",content.getCarName());
                    carInfo.put("carPrice",content.getCarPrice());
                    carInfo.put("carAmount",content.getCarAmount());
                    carInfo.put("carPeople",content.getCarPeople());
                    carInfo.put("carGood",content.getCarGood());
                    carInfo.put("carInfo",content.getCarInfo());

                    carList.add(carInfo);
                }
            }
            result.put("carList",carList);
        }
        //超级管理员,所有店铺，及所有商家下的管理员
        else if(2 == user.getIsAdmin()){
            JSONArray shopList= new JSONArray();

            List<Shop> allShop = shopDao.all();
            for(Shop content:allShop){
                JSONObject shop=new JSONObject();
                shop.put("shopId",content.getShopId());
                shop.put("shopName",content.getShopName());
                shop.put("shopLocation",content.getShopLocation());
                shop.put("shopPhone",content.getShopPhone());

                List<Admin> admins = adminDao.selectShopAdmin(content.getShopId());

                JSONArray adminList = new JSONArray();
                for(Admin admin:admins){
                    JSONObject adminInfo = new JSONObject();
                    String adminId = admin.getUserId();
                    String shopId = admin.getShopId();
                    Shop shop1 = shopDao.selectById(shopId);
                    User adminUser = selectUser(adminId);
                    adminInfo.put("userId",adminUser.getUserId());
                    adminInfo.put("userName",adminUser.getUserName());
                    adminInfo.put("shopName",shop1.getShopName());
                    adminInfo.put("userCount",adminUser.getUserCount());
                    adminInfo.put("userImage",adminUser.getUserImage());
                    adminInfo.put("userTime",adminUser.getUserRegistration());
                    adminList.add(adminInfo);
                }
                shop.put("adminList",adminList);
                shopList.add(shop);
            }
            result.put("shopList",shopList);
        }

        result.put("baseInfo",baseInfo);


        return result;
    }

    @Override
    public String selectNameById(String userId) {
        return userDao.selectNameById(userId);
    }


    /**
     * 登录、注册检查
     * 登录时 用户登录账号的name值为 userCount
     *  存在且激活则通过
     * 注册时 用户名的name值为 userName
     *  存在不通过
     * 注册时 邮箱的name值为 email
     *  存在不通过
     * @param name 表单name值
     * @param param 表单输入值
     * @return 校验结果和显示文字
     */
    @Override
    public JSONObject check(String name,String param) {
        JSONObject jsonObject = new JSONObject();
        String result = "n";
        //登录时账号查询 存在且激活 通过
        if("userCount".equals(name)){
            User user=userDao.selectCount(param);
            if(user!=null){
                result = "y";
            }
            if("y".equals(result)){
                jsonObject.put("status", result);
                jsonObject.put("info"," " );
            } else if("n".equals(result)){
                jsonObject.put("status", result);
                jsonObject.put("info", "账号不存在或未激活");
            }
        //注册时邮箱查询 不存在 通过
        }else if("email".equals(name)){
            User user = userDao.selectEmail(param);
            if (user==null){
                result = "y";
            }
            if("y".equals(result)){
                jsonObject.put("status", result);
                jsonObject.put("info"," " );
            } else if("n".equals(result)){
                jsonObject.put("status", result);
                jsonObject.put("info", "邮箱已被注册！");
            }
        //注册时用户名查询 不存在 通过
        }else if ("userName".equals(name)){
            User user = userDao.selectName(param);
            if (user==null){
                result = "y";
            }
            if("y".equals(result)){
                jsonObject.put("status", result);
                jsonObject.put("info"," " );
            } else if("n".equals(result)){
                jsonObject.put("status", result);
                jsonObject.put("info", "该名称已被占用！");
            }
        }
        return jsonObject;
    }

    /**
     * 检查密码
     * @param userCount 用户名
     * @param password 用户密码
     * @return
     */
    @Override
    public JSONObject checkPassword(String userCount,String password){
        JSONObject result = new JSONObject();
        String status = "n";
        String truePassword= userDao.selectPassword(userCount);
        if(truePassword.equals(password)){
            status ="y";
        }
        if("y".equals(status)){
            result.put("status", status);
            result.put("info"," " );
        } else if("n".equals(status)){
            result.put("status", status);
            result.put("info", "密码错误！");
        }

        return result;
    }

    /**
     * 激活账户，首先根据激活账户的id查询是否有该用户
     * @param userId 用户id
     * @return
     */
    @Override
    public JSONObject activeCount(String userId){
        String name =userDao.selectNameById(userId);
        JSONObject result=new JSONObject();
        if(name!=null){
            User user=new User();
            user.setUserId(userId);
            user.setIsActive(1);
            userDao.updateUser(user);
            result.put("status","y");
            result.put("info","尊敬的"+name+"您好，您的账户已成功激活，3秒后将前往<a href=\"login.jsp\">登录页面</a>");
        }else{
            result.put("status","n");
            result.put("info","该用户id错误，请检查邮件。如有问题，<a href=\"mailto:ytulnj@163.com\">请联系管理员</a>");
        }
        return result;
    }

    @Override
    public JSONObject checkAdmin(String userCount){
        User user = userDao.checkAdmin(userCount);
        JSONObject result = new JSONObject();
        int level =user.getIsAdmin();
        //用户
        if (level == 0 ){
            result.put("level",0);
        }
        //管理员
        else if(level == 1 ){
            result.put("level",1);
            result.put("shopInfo","");
        }
        //超级管理员
        else if(level == 2){
            result.put("level",2);
        }
        result.put("userImage",user.getUserImage());
        result.put("userId",user.getUserId());
        result.put("userName",user.getUserName());
        return result;
    }

    @Override
    public User selectUser(String userId) {
        return userDao.selectById(userId);
    }

    @Override
    public JSONArray autoComplete(String keyword) {
        List<User> list = userDao.auto(keyword);

        JSONArray result = new JSONArray();

        for (User user:list) {
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("value",user.getUserCount());
            jsonObject.put("label",user.getUserCount());
            jsonObject.put("time",user.getUserRegistration());
            jsonObject.put("image",user.getUserImage());
            jsonObject.put("id",user.getUserId());

            result.add(jsonObject);
        }

        return result;
    }

    @Override
    public JSONObject setAdmin(String userCount, String shopName) {
        User user=userDao.selectCount(userCount);
        JSONObject result = new JSONObject();
        if(user!=null&&user.getIsAdmin()!= 1 ){
            Shop shop = shopDao.selectByName(shopName);
            if(shop!=null ){
                userDao.setAdmin(user.getUserId());
                Admin admin=new Admin();
                admin.setId(UUID.randomUUID().toString());
                admin.setUserId(user.getUserId());
                admin.setShopId(shop.getShopId());
                adminDao.insert(admin);
                result.put("status","y");
                result.put("info","成功创建管理员");
            }else {
                result.put("status","n");
                result.put("info","该商家不存在或未激活");
            }
        }else {
            result.put("status","n");
            result.put("info","该用户不存在或未激活或已经为管理员");
        }
        return result;
    }

    @Override
    public String selectShopNameByUserId(String userId) {
        String shopId = adminDao.selectShopIdByUserId(userId);
        Shop shop =  shopDao.selectById(shopId);
        return shop.getShopName();
    }

    @Override
    public void updateImage(String imageName,String userId) {
        User user= new User();
        user.setUserId(userId);
        user.setUserImage(imageName);
        userDao.updateUser(user);
    }

    @Override
    public void deleteAdmin(String userId) {
        userDao.deleteAdmin(userId);
    }

    @Override
    public void updatePassword(String userId, String newPassword) {
        User user = new User();
        user.setUserId(userId);
        user.setUserPassword(newPassword);
        userDao.updateUser(user);
    }

    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

}
