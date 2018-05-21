package cn.lnj.project.car.service;


import cn.lnj.project.car.data.Car;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.List;
import java.util.Map;

public interface CarService {

    void insert(Car car);

    /*获取所有车辆信息*/
    List<Car> all();

    /**
     * 车辆模板查询
     */
    JSONArray infoAll(Map<String, Object> parameters);

    /**
     *  根据车辆id查询
     * @param id 车辆id
     * @return
     */
    JSONObject selectById(String id);

    /**
     * 删除车辆
     * @param carId 车辆id
     */
    void deleteCarById(String carId);

    /**
     * 更新车辆
     * @param carId 车辆id
     * @param amount 车辆数量
     */
    void updateCarAmount(String carId,int amount);

    /**
     * 输入框自动提示
     * @param keyword 关键字
     * @return
     */
    JSONArray auto(String keyword);

    void update(Car car);
}
