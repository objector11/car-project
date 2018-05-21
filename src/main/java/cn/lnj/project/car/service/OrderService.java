package cn.lnj.project.car.service;


/**
 * 订单的服务层
 * @author 刘乃杰
 *
 */
public interface OrderService {

    /**
     *  用户成功租车后，订单表增加一条记录
     * @param carId 车辆id
     * @param userId 用户id
     * @param shopId 商家id
     * @param price 价格
     */
    void insertOrder(String carId,String userId,String shopId,double price);

}
