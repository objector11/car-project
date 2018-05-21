package cn.lnj.project.car.dao;


import cn.lnj.project.car.data.Car;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface CarDao {
    /**
     * 插入车辆
     * @param car
     */
    void insert(Car car);

    /**
     *  获取车辆信息
     */
    List<Car> all();


    List<Car> infoAll(Map<String, Object> parameters);

    /**
     * 根据id查询车辆
     * @param id 车辆id
     * @return
     */
    Car selectById(String id);

    /**
     * 查询管理员自己上传过的车辆
     * @param userId 上传者的id
     * @return 车辆列表
     */
    List<Car> selectByUserId(String userId);

    /**
     * 删除车辆
     * @param carId 车辆id
     */
    void deleteCarById(String carId);

    /**
     * 根据商家id查询车辆
     * @param shopId 商家id
     * @return
     */
    List<Car> selectByShopId(String shopId);

    /**
     * 更新车辆数量，完成租赁后车辆减少
     * @param car
     */
    void updateCar(Car car);

    /**
     * 输入框自动提示
     * @param keyword 关键字
     * @return
     */
    List<Car> auto(String keyword);
}

