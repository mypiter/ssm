package com.generator.service.impl;

import com.generator.mapper.OutStorageMapper;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.OutStorage;
import com.generator.service.OutStorageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
@Service
public class OutStorageServiceImpl implements OutStorageService {
    @Resource
    OutStorageMapper outStorageMapper;
    @Override
    public List<OutStorage> selectAll(int cur,int limit,String orderAccount,String purchaseSpec,String fluteType,String chang,String k,String minNum,String maxNum) {
        List<OutStorage>list=new ArrayList<OutStorage>();
        list=outStorageMapper.select(cur,limit,orderAccount,purchaseSpec,fluteType,chang,k,minNum,maxNum);
        return list;
    }

    @Override
    public int updateOut(int pur_id,int rk) {
        int num=outStorageMapper.updataOut(pur_id,rk);
        return num;
    }

    @Override
    public OutStorage selectById(int pur_id) {
        OutStorage outStorage=outStorageMapper.selectByPrimaryKey(pur_id);
        return outStorage;
    }

    @Override
    public int addOutStoragerS(List<OutStorage> list) {
        return outStorageMapper.addOutStoragerS(list);
    }

    @Override
    public List<OutStorage> findByPurOut(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime,String orderAccount) {
        return outStorageMapper.findByPurOut(cur,rows,sort,order,queryList,startTime,endTime,orderAccount);
    }

    @Override
    public List<OutStorage> findByPurOutAll(List<ComplexQuery> queryList, String startTime, String endTime,String orderAccount) {
        return outStorageMapper.findByPurOutAll(queryList,startTime,endTime,orderAccount);
    }

    @Override
    public OutStorage getMaxOutStorAccount(String time1) {
        return outStorageMapper.getMaxOutStorAccount(time1);
    }
}
