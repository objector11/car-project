package cn.lnj.project.car.service.impl;

import cn.lnj.project.car.dao.CarDao;
import cn.lnj.project.car.dao.ShopDao;
import cn.lnj.project.car.data.Car;
import cn.lnj.project.car.data.Shop;
import cn.lnj.project.car.service.CarService;
import cn.lnj.project.car.service.ShopService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.omg.CORBA.MARSHAL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ShopServiceImpl implements ShopService {

    @Autowired
    private ShopDao shopDao;
    @Autowired
    private CarDao carDao;
    @Autowired
    private CarService carService;


    @Override
    public void insert(Shop shop) {
        shopDao.insert(shop);
    }

    @Override
    public List<Shop> selectAllShop() {
        return shopDao.all();
    }

    @Override
    public JSONObject selectById(String id) {
        JSONObject result =new JSONObject();
        JSONObject info = new JSONObject();
        Shop shop = shopDao.selectById(id);

        result.put("infoType","shop");

        info.put("shopName",shop.getShopName());
        info.put("shopLocation",shop.getShopLocation());
        info.put("shopPhone",shop.getShopPhone());
        info.put("shopEmail",shop.getShopEmail());
        info.put("shopJingDu",shop.getJingDu());
        info.put("shopWeiDu",shop.getWeidu());

        String  shopId= shop.getShopId();

        Map map=new HashMap();
        map.put("shopId",shopId);

        JSONArray carList=carService.infoAll(map);

        info.put("carCount",carList.size());
        info.put("carList",carList);


        result.put("info",info);
        return result;
    }

    /**
     * 删除商家和商家下的车辆
     *  先删除商家，然后得到该商家下面的车辆，将车辆删除
     * @param shopId 商家id
     */
    @Override
    public void deleteShopById(String shopId){
        shopDao.deleteById(shopId);
        List<Car> carList = carDao.selectByShopId(shopId);
        for (Car car:carList){
            carDao.deleteCarById(car.getCarId());
        }
    }

    @Override
    public Shop selectShop(String shopId) {
        return shopDao.selectById(shopId);
    }

    @Override
    public JSONArray auto(String param) {
        JSONArray result = new JSONArray();

        List<Shop> list = shopDao.auto(param);

        for(Shop content:list){
            JSONObject info = new JSONObject();

            info.put("id",content.getShopId());
            info.put("value",content.getShopName());
            info.put("label",content.getShopName());
            info.put("type","shop");
            result.add(info);
        }
        return result;
    }

    @Override
    public JSONObject check(String name, String param) {
        JSONObject jsonObject = new JSONObject();
        String result = "n";
        Map map=new HashMap();
        map.put(name,param);
        Shop shop=shopDao.checkShop(map);
        if("shopName".equals(name)){
            if(shop==null){
                result = "y";
            }
            if("y".equals(result)){
                jsonObject.put("status", result);
                jsonObject.put("info"," " );
            } else if("n".equals(result)){
                jsonObject.put("status", result);
                jsonObject.put("info", "该名称已有商家使用");
            }
        }else if("shopPhone".equals(name)){
            if (shop==null){
                result = "y";
            }
            if("y".equals(result)){
                jsonObject.put("status", result);
                jsonObject.put("info"," " );
            } else if("n".equals(result)){
                jsonObject.put("status", result);
                jsonObject.put("info", "该电话已有商家使用");
            }
        }else if ("shopEmail".equals(name)){
            if (shop==null){
                result = "y";
            }
            if("y".equals(result)){
                jsonObject.put("status", result);
                jsonObject.put("info"," " );
            } else if("n".equals(result)){
                jsonObject.put("status", result);
                jsonObject.put("info", "该邮箱已有商家使用！");
            }
        }else if("shopLocation".equals(name)){
            if (shop==null){
                result = "y";
            }
            if("y".equals(result)){
                jsonObject.put("status", result);
                jsonObject.put("info"," " );
            } else if("n".equals(result)){
                jsonObject.put("status", result);
                jsonObject.put("info", "该位置已有商家使用！");
            }
        }
        return jsonObject;
    }

    @Override
    public void updateShop(Shop shop) {
        shopDao.updateShop(shop);
    }
}
