package cn.lnj.project.car.controller;

import cn.lnj.project.car.data.Shop;
import cn.lnj.project.car.data.User;
import cn.lnj.project.car.service.CarService;
import cn.lnj.project.car.service.OrderService;
import cn.lnj.project.car.service.ShopService;
import cn.lnj.project.car.service.UserService;
import cn.lnj.project.car.util.SendMail;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 订单控制层，用户确定租车后发送 用户id，车辆id，商家id
 * @author 刘乃杰
 */
@Controller
@RequestMapping(value = "/order")
public class OrderController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private CarService carService;
    @Autowired
    private SendMail sendMail;
    @Autowired
    private UserService userService;
    @Autowired
    private ShopService shopService;


    /**
     * 用户完成租赁后，向订单表新增记录，车辆表更新数据，数量减少,用户的租赁次数加一
     * @param carId 车辆id
     * @param userId 用户id
     * @param shopId 商家id
     * @param price 价格
     * @param count 数量
     */
    @RequestMapping(value = "/insert" , method = RequestMethod.GET )
    @ResponseBody()
    public void insert(@RequestParam String carId,String userId,String shopId,double price,int count){
        //订单表插入数据
        orderService.insertOrder(carId,userId,shopId,price);
        carService.updateCarAmount(carId,count);
        User user = userService.selectUser(userId);
        //用户表更新租赁次数
        User user1= new User();
        user1.setUserId(userId);
        user1.setRentCount(user.getRentCount()+1);
        userService.updateUser(user1);
        // 租赁成功后给用户和商家发送邮件，先屏蔽
        Shop shop= shopService.selectShop(shopId);
        sendMail.successInform(user.getUserEmail(),user.getUserName(),shop.getShopEmail(),shop.getShopName(),shop.getShopPhone());
    }

    /**
     *  查询订单， 根据用户id查询用户的订单
     * @param userId 用户id
     * @return
     */
    @RequestMapping(value = "/userId",method = RequestMethod.GET)
    @ResponseBody()
    public JSONObject selectByUserId(@RequestParam String userId){
        return null;
    }

}
