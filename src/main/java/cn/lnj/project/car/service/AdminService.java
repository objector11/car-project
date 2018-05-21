package cn.lnj.project.car.service;


public interface AdminService {

     /**
      * 根据用户id查询商家id
      * @param userId 用户id
      * @return
      */
     String selectShopIdByUserId(String userId);

     /**
      * 删除管理员
      * @param userId 用户id
      */
     void deleteAdmin(String userId);
}
