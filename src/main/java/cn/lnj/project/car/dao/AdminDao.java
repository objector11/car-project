package cn.lnj.project.car.dao;

import cn.lnj.project.car.data.Admin;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminDao {

    /**
     *  插入商家
     * @param admin 商家
     */
    void insert(Admin admin);

    /**
     * 根据用户id查询商家id
     * @param userId 用户id
     * @return
     */
    String selectShopIdByUserId(String userId);

    /**
     * 查询一个商家下的所有管理员
     * @param shopId 商家id
     * @return
     */
    List<Admin> selectShopAdmin(String shopId);

    /**
     * 删除管理员
     * @param userId 用户id
     */
    void deleteAdmin(String userId);
}
