package cn.lnj.project.car.service.impl;

import cn.lnj.project.car.dao.AdminDao;
import cn.lnj.project.car.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public String selectShopIdByUserId(String userId) {
        return adminDao.selectShopIdByUserId(userId);
    }

    @Override
    public void deleteAdmin(String userId) {
        adminDao.deleteAdmin(userId);
    }
}
