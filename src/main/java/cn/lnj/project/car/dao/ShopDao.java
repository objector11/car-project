package cn.lnj.project.car.dao;

import cn.lnj.project.car.data.Shop;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author 刘乃杰
 */
@Repository
public interface ShopDao {

    /**
     * 新建商家
     * @param shop
     */
    void insert(Shop shop);

    /**
     * 全部商家信息
     * @return list
     */
     List<Shop> all();

    /**
     * 根据商家id查询
     * @param shopId 商家id
     * @return 商家名称
     */
    Shop selectById(String shopId);


    /**
     * 根据商家id删除商家
     * @param shopId 商家id
     */
    void deleteById(String shopId);

    /**
     * 输入框自动提示
     * @param param
     * @return
     */
    List<Shop> auto(String param);

    /**
     * 根据商家名称查询
     * @param name 商家名称
     * @return
     */
    Shop selectByName(String name);

    /**
     *商家注册检查
     * @param param
     * @return
     */
    Shop checkShop(Map param);

    void updateShop(Shop shop);
}
