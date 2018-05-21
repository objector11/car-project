package cn.lnj.project.car.service.impl;

import cn.lnj.project.car.dao.OrderDao;
import cn.lnj.project.car.data.Order;
import cn.lnj.project.car.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;


    @Override
    public void insertOrder(String carId, String userId, String shopId, double price) {
        Order order=new Order();
        order.setOrderId(UUID.randomUUID().toString());
        order.setCarId(carId);
        order.setUserId(userId);
        order.setShopId(shopId);
        order.setPrice(price);
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = formatter.format(currentTime);
        order.setOrderTime(dateString);

        orderDao.insert(order);
    }
}
