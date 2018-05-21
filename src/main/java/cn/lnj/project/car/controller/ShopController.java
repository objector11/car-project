package cn.lnj.project.car.controller;

import cn.lnj.project.car.data.Shop;
import cn.lnj.project.car.service.ShopService;
import cn.lnj.project.car.util.SendMail;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping(value = "/shop")
public class ShopController {
    @Autowired
    ShopService shopService;
    @Autowired
    SendMail sendMail;

    /**
     * 新建商家
     * @param shopName 商家名称
     * @param shopPhone 商家联系方式
     * @param shopEmail 商家邮箱
     * @param shopLocation 商家位置
     * @param jingdu 经度
     * @param weidu 纬度
     */
    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    @ResponseBody
    public void insert(@RequestParam String shopName,String shopPhone,String shopEmail,String shopLocation,double jingdu,double weidu){
        Shop shop=new Shop();
        shop.setShopId(UUID.randomUUID().toString());
        shop.setShopName(shopName);
        shop.setShopPhone(shopPhone);
        shop.setShopEmail(shopEmail);
        shop.setShopLocation(shopLocation);
        shop.setJingDu(jingdu);
        shop.setWeidu(weidu);
        shopService.insert(shop);

        //向商家邮箱发送邮件
        sendMail.shopRegist(shopEmail,shopName);
    }

    /**
     * 根据商家id查询商家信息
     * @param id 车辆id
     * @return 该id车辆的详细信息
     */
    @RequestMapping(value = "/id",method = RequestMethod.GET)
    @ResponseBody
    public JSONObject selectById(@RequestParam String id){
        return shopService.selectById(id);
    }

    /**
     * 更新商家
     */
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public void update(@RequestParam String shopName,String shopPhone,String shopEmail,String shopLocation,double jingdu,double weidu,String shopId){
        Shop shop=new Shop();
        shop.setShopId(shopId);
        shop.setShopName(shopName);
        shop.setShopLocation(shopLocation);
        shop.setShopPhone(shopPhone);
        shop.setShopEmail(shopEmail);
        shop.setJingDu(jingdu);
        shop.setWeidu(weidu);

        shopService.updateShop(shop);
    }

    /**
     * 删除商家
     * 同时也要将该商家下的车辆删除
     * @param ids 商家id的数组
     */
    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    public void delete(@RequestParam String ids){
        String[] shopIds = ids.split(",");
        for (String shopId:shopIds) {
            shopService.deleteShopById(shopId);
        }
    }

    /**
     * 输入框自动提示
     * @param keyword 关键字
     * @return
     */
    @RequestMapping(value = "/autoComplete",method = RequestMethod.GET)
    @ResponseBody
    public JSONArray autoComplete(@RequestParam String keyword){
        return shopService.auto(keyword);
    }

    /**
     * 注册商家校验
     * @param name 名称
     * @param param 值
     * @return
     */
    @RequestMapping(value = "/check",method = RequestMethod.GET)
    @ResponseBody
    public JSONObject check(@RequestParam String name,String param){
        return shopService.check(name,param);
    }
}
