package com.generator.service;
import com.generator.dao.AbstrctDao;
import com.generator.pojo.Admin;
import com.generator.pojo.ComplexQuery;

import java.util.List;

/**
 * autor QT001
 */
public interface AdminService{
    Admin getById(int id);
    //登录接口
     Admin login(String account,String password);

    int updateAdmin(Admin user);

    List<Admin> selectAdmin(int cur, int rows, String sort, String order, List<ComplexQuery> queryList);

    List<Admin> selectAdminAll(List<ComplexQuery> queryList);

    int deleteAdmin(int i);

    int addAdmin(Admin user);

    Admin getAdmin(int adminId);
}
