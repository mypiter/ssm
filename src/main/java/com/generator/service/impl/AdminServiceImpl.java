package com.generator.service.impl;

import com.generator.common.SystemException;
import com.generator.mapper.AdminMapper;
import com.generator.pojo.Admin;
import com.generator.pojo.ComplexQuery;
import com.generator.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;

import static com.generator.common.UserUtil.$;

@Service
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminMapper adminMapper;

    @Override
    public Admin getById(int id) {


        return null;
    }

    @Override
    public Admin login(String account,String password) {
        $("账号不能为空！",account);
        $("密码不能为空！",password);
        Admin admin=adminMapper.selectByAccount(account);
        if (admin==null){
            throw new SystemException("账号不存在！");
        }
        if(!admin.getAdminPassword().equals(password.trim())){
            throw new SystemException("密码错误！");
        }
        return admin;
    }

    @Override
    public int updateAdmin(Admin user) {
        return adminMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public List<Admin> selectAdmin(int cur, int rows, String sort, String order, List<ComplexQuery> queryList) {
        return adminMapper.selectAdmin(cur,rows,sort,order,queryList);
    }

    @Override
    public List<Admin> selectAdminAll(List<ComplexQuery> queryList) {
        return adminMapper.selectAdminAll(queryList);
    }

    @Override
    public int deleteAdmin(int i) {
        return adminMapper.deleteByPrimaryKey(i);
    }

    @Override
    public int addAdmin(Admin user) {
        return adminMapper.insertSelective(user);
    }

    @Override
    public Admin getAdmin(int adminId) {
        return adminMapper.selectByPrimaryKey(adminId);
    }

}
