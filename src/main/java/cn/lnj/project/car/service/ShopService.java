package cn.lnj.project.car.service;

import cn.lnj.project.car.data.Shop;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.List;

public interface ShopService {

    void insert(Shop shop);

    List<Shop> selectAllShop();

    JSONObject selectById(String id);

    /**
     * 删除商家，同时将商家下的车辆删除
     * @param shopId 商家id
     */
    void deleteShopById(String shopId);

    Shop selectShop(String shopId);

    JSONArray auto(String param);

    JSONObject check(String name,String param);

    void updateShop(Shop shop);
}
