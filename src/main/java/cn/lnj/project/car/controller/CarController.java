package cn.lnj.project.car.controller;



import cn.lnj.project.car.data.Car;
import cn.lnj.project.car.service.AdminService;
import cn.lnj.project.car.service.CarService;
import cn.lnj.project.car.service.ShopService;
import cn.lnj.project.car.util.SaveImages;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;


/**
 * @author 刘乃杰
 */
@Controller
@RequestMapping("/car")
public class CarController {

    @Autowired
    private CarService carService;
    @Autowired
    private SaveImages saveImages;
    @Autowired
    private ShopService shopService;
    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/all",method = RequestMethod.GET)
    @ResponseBody
    public List<Car> all(){
        return  carService.all();
    }

    /**
     * 车辆模板所需内容,
     * @return
     */
    @RequestMapping(value = "/infoAll",method = RequestMethod.POST)
    @ResponseBody
    public JSONArray infoAll(@RequestBody Map<String, Object> parameters){
        Map<String ,Object> param = new HashMap<String,Object>();
        Object carBrand = parameters.get("carBrand");
        Object carType = parameters.get("carType");
        Object startPrice = parameters.get("startPrice");
        Object endPrice = parameters.get("endPrice");

        if(carBrand!=null&& !("".equals(carBrand)) ){
            param.put("carBrand",carBrand);
        }else {
            param.put("carBrand","%");
        }
        if(carType!=null&& !("".equals(carType)) ){
            param.put("carType",carType);
        }
        if(startPrice!=null&& !("".equals(startPrice)) ){
            param.put("startPrice",startPrice);
        }
        if(endPrice!=null&& !("".equals(endPrice)) ){
            param.put("endPrice",endPrice);
        }
        param.put("limit",20);
        return  carService.infoAll(param);
    }


    /**
     * 根据车辆id查询车辆信息
     * @param id 车辆id
     * @return 该id车辆的详细信息
     */
    @RequestMapping(value = "/id",method = RequestMethod.GET)
    @ResponseBody
    public JSONObject selectById(@RequestParam String id){
        return carService.selectById(id);
    }


    /**
     * 上传车辆信息
     *  还需要上传者id，和商家id
     *  返回modelandview 返回一个页面，在这个页面写一个跳转到首页
     *  将车辆的图片等信息存储到 skins/images 文件夹中
     */
    @RequestMapping(value = "/insert" , method = RequestMethod.POST )
    @ResponseBody()
    public ModelAndView insert(@RequestParam("files") MultipartFile[] files, @RequestParam("carBrand") String carBrand,
                               @RequestParam("carName") String carName, @RequestParam("carType") String carType,
                               @RequestParam("carPrice") double carPrice, @RequestParam("carAmount") int carAmount,
                               @RequestParam("carPeople") int carPeople, @RequestParam("carGood") double carGood,
                               @RequestParam("carInfo") String carInfo, @RequestParam("carMilage") int carMilage,
                               @RequestParam("carTime") String carTime, @RequestParam("userId") String userId,
                               HttpServletRequest request){
        String shopId = adminService.selectShopIdByUserId(userId);
        String  carImages = saveImages.saveImages(files,UUID.randomUUID().toString(),request);

        Car car=new Car();
        car.setCarId(UUID.randomUUID().toString());
        car.setCarBrand(carBrand);
        car.setCarName(carName);
        car.setCarType(carType);
        car.setCarImage(carImages);
        car.setCarPrice(carPrice);
        car.setCarAmount(carAmount);
        car.setCarPeople(carPeople);
        car.setCarGood(carGood);
        car.setCarInfo(carInfo);
        car.setRentCount(0);
        car.setShopId(shopId);
        car.setCarMilage(carMilage);
        car.setCarTime(carTime);
        car.setUserId(userId);

        carService.insert(car);

        return new ModelAndView("public/insertCar");
    }

    /**
     * 修改车辆信息,可以更新车辆图片和其他信息。但是租赁次数是不能修改的
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView update(@RequestParam("files") MultipartFile[] files, @RequestParam("carBrand") String carBrand,
                       @RequestParam("carName") String carName, @RequestParam("carType") String carType,
                       @RequestParam("carPrice") double carPrice, @RequestParam("carAmount") int carAmount,
                       @RequestParam("carPeople") int carPeople, @RequestParam("carGood") double carGood,
                       @RequestParam("carInfo") String carInfo, @RequestParam("carMilage") int carMilage,
                       @RequestParam("carTime") String carTime, @RequestParam("userId") String userId,
                       @RequestParam("oldPath") String oldPath,@RequestParam("carId") String carId,
                       HttpServletRequest request){
        String shopId = adminService.selectShopIdByUserId(userId);
        String  carImages="";
        if(files.length>0){
            carImages = saveImages.saveImages(files,UUID.randomUUID().toString(),request);
        }
        if(oldPath!=null&&!"".equals(oldPath)){
            carImages+=","+oldPath;
        }
        Car car=new Car();
        car.setCarId(carId);
        car.setCarBrand(carBrand);
        car.setCarName(carName);
        car.setCarType(carType);
        car.setCarImage(carImages);
        car.setCarPrice(carPrice);
        car.setCarAmount(carAmount);
        car.setCarPeople(carPeople);
        car.setCarGood(carGood);
        car.setCarInfo(carInfo);
        car.setShopId(shopId);
        car.setCarMilage(carMilage);
        car.setCarTime(carTime);
        car.setUserId(userId);

        carService.update(car);

        return new ModelAndView("public/updateCar");
    }

    /**
     * 删除车辆
     * @param ids 车辆id数组
     */
    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    public void delete(@RequestParam String ids){
        String[] carIds=ids.split(",");
        for (String carId:carIds) {
            carService.deleteCarById(carId);
        }
    }

    /**
     * 输入框自动提示
     * @param keyword 关键字
     * @return
     */
    @RequestMapping(value = "/autoComplete",method = RequestMethod.GET)
    @ResponseBody
    public JSONArray autoComplete(@RequestParam("keyword") String keyword){
        JSONArray carList=carService.auto(keyword);
        JSONArray shopList=shopService.auto(keyword);
        JSONArray result = new JSONArray();
        result.addAll(carList);
        result.addAll(shopList);
        return result;
    }
}


