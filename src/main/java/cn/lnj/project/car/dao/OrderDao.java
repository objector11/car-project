package cn.lnj.project.car.dao;

import cn.lnj.project.car.data.Order;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDao {

    /**
     * 插入订单
     * @param order 订单信息
     */
    void insert(Order order);


    /**
     * 查询该用户下的订单
     * @param userId 用户id
     * @return
     */
    List<Order> selectByUserId(String userId);
}
