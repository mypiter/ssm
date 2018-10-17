package com.generator.service.impl;

import com.generator.mapper.CustomMapper;
import com.generator.pojo.CartonOutInfo;
import com.generator.pojo.CartonStock;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Custom;
import com.generator.service.CustomService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 客户业务实现层
 */
@Service
public class CustomServiceImpl implements CustomService {
    @Resource
    private CustomMapper customMapper;

    /**
     * 新增客户信息
     * @param custom
     * @return
     */
    @Override
    public int addCustom(Custom custom) {
        return customMapper.insert(custom);
    }

    /**
     * 客户下拉框查询出所有客户信息
     * @return
     */
    @Override
    public List<Custom> selects(String q) {
        List<Custom> list = new ArrayList<>();
        list = customMapper.selects(q);
        return list;
    }

    @Override
    public List<Custom> selectBylist(List<CartonStock> list) {

        return customMapper.selectBylist(list);
    }

    /**
     * 根据id查询客户信息
     * @param customId
     * @return
     */
    @Override
    public Custom selectById(int customId) {
        return customMapper.selectByPrimaryKey(customId);
    }

    @Override
    public List<Custom> selectAll(String q) {
        List<Custom>list=new ArrayList<Custom>();
        list=customMapper.selects(q);//这里需要实现结果集转化
        return list;
    }

    @Override
    public int updateCustom(Custom custom) {
        int num=customMapper.updateByPrimaryKeySelective(custom);
        return num;
    }

    @Override
    public int deleteCustom(int i) {
        int num = customMapper.deleteByPrimaryKey(i);
        return num;
    }

    @Override
    public List<Custom> selectAlls(List<ComplexQuery> queryList) {
        List<Custom>list=new ArrayList<Custom>();
        list=customMapper.selectAll(queryList);//这里需要实现结果集转化
        return list;
    }

    @Override
    public List<Custom> selects(List<CartonStock> list) {
        return customMapper.selectA(list);
    }

    @Override
    public List<Custom> selectB(List<CartonOutInfo> list) {
        return customMapper.selectB(list);
    }

    @Override
    public List<Custom> select(int cur, int rows, String sort, String oder, List<ComplexQuery> queryList) {
        return customMapper.select(cur,rows,sort,oder,queryList);
    }

    @Override
    public List<Custom> getListByPid() {
        String q="";
        return customMapper.selects(q);
    }

    @Override
    public int updateByCusFakeS(List<Custom> listCustom) {
        return customMapper.updateByCusFakeS(listCustom);
    }
}
