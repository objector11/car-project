package cn.lnj.project.car.service.impl;

import cn.lnj.project.car.dao.CarDao;
import cn.lnj.project.car.dao.ShopDao;
import cn.lnj.project.car.data.Car;
import cn.lnj.project.car.data.Shop;
import cn.lnj.project.car.service.CarService;
import cn.lnj.project.car.service.UserService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class CarServiceImpl implements CarService {

    @Autowired
    private CarDao carDao;

    @Autowired
    private ShopDao shopDao;

    @Autowired
    private UserService userService;


    @Override
    public void insert(Car car) {
        carDao.insert(car);
    }

    @Override
    public List<Car> all() {
        return carDao.all();
    }

    @Override
    public JSONArray infoAll(Map<String, Object> parameters) {
        JSONArray result=new JSONArray();
        List<Car> carList = carDao.infoAll(parameters);
        for (Car item:carList) {
            JSONObject message=new JSONObject();
            String shopId = item.getShopId();
            message.put("carId",item.getCarId());
            //图片有多张，这里只取第一张
            String[] images= item.getCarImage().split(",");
            for(int i=0;i<images.length;i++){
                if(!"".equals(images[i])){
                    message.put("carImage",images[i]);
                    break;
                }
            }
            message.put("carPrice",item.getCarPrice());
            message.put("rentCount",item.getRentCount());
            message.put("carAmount",item.getCarAmount());
            message.put("carBrand",item.getCarBrand());
            message.put("carName",item.getCarName());
            message.put("shopId",shopId);
            Shop shop = shopDao.selectById(shopId);
            message.put("shopName",shop.getShopName());
            result.add(message);
        }
        return result;
    }

    @Override
    public JSONObject selectById(String id) {
        Car car = carDao.selectById(id);
        JSONObject result = new JSONObject();
        result.put("infoType","car");
        if(car!=null){
            JSONObject info = new JSONObject();
            info.put("carBrand",car.getCarBrand());
            info.put("carName",car.getCarName());
            info.put("carType",car.getCarType());

            String[] imagesAll = car.getCarImage().split(",");
            List images = new ArrayList();
            for (String image:imagesAll) {
                if(!"".equals(image)&&image!=null){
                    images.add(image);
                }
            }
            info.put("carImages",images);
            info.put("carPrice",car.getCarPrice());
            info.put("carAmount",car.getCarAmount());
            info.put("carPeople",car.getCarPeople());
            info.put("carGood",car.getCarGood());
            info.put("carInfo",car.getCarInfo());
            info.put("rentCount",car.getRentCount());
            info.put("carMilage",car.getCarMilage());
            info.put("carTime",car.getCarTime());

            String userId= car.getUserId();
            String name = userService.selectNameById(userId);
            info.put("carUserId",car.getUserId());
            info.put("carUserName",name);

            String shopId =car.getShopId();
            Shop shop = shopDao.selectById(shopId);
            info.put("shopId",shop.getShopId());
            info.put("shopName",shop.getShopName());
            info.put("shopLocation",shop.getShopLocation());
            info.put("shopPhone",shop.getShopPhone());
            info.put("shopJingDu",shop.getJingDu());
            info.put("shopWeiDu",shop.getWeidu());

            Map<String,Object> likeCar = new HashMap<String,Object>();
            likeCar.put("carType",car.getCarType());
            likeCar.put("selfCarId",car.getCarId());
            JSONArray likeCarList = infoAll(likeCar);
            info.put("likeCarList",likeCarList);

            result.put("info",info);
        }

        return  result;
    }

    /**
     * 根据id删除车辆
     * @param carId 车辆id
     */
    @Override
    public void deleteCarById(String carId){
        carDao.deleteCarById(carId);
    }


    // 更新车辆出错 ，车辆输出数量错误
    @Override
    public void updateCarAmount(String carId,int amount){
        Car old=carDao.selectById(carId);
        int oldAmount = old.getCarAmount();
        int oldRentCount = old.getRentCount();
        Car car = new Car();
        car.setCarId(carId);
        car.setRentCount(oldRentCount+1);
        int reset= oldAmount-amount;
        car.setCarAmount(reset);
        carDao.updateCar(car);
    }

    @Override
    public JSONArray auto(String keyword) {
        JSONArray result = new JSONArray();

        List<Car> list = carDao.auto(keyword);

        for(Car content:list){
            JSONObject info = new JSONObject();
            info.put("id",content.getCarId());
            info.put("value",content.getCarBrand()+" "+content.getCarName()+"("+content.getCarType()+")");
            info.put("label",content.getCarBrand()+" "+content.getCarName()+"("+content.getCarType()+")");
            info.put("type","car");

            result.add(info);
        }
        return result;
    }

    @Override
    public void update(Car car) {
        carDao.updateCar(car);
    }
}
