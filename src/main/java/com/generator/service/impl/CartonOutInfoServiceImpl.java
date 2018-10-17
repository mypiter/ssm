package com.generator.service.impl;

import com.generator.mapper.CartonOutInfoMapper;
import com.generator.pojo.CartonOutInfo;
import com.generator.pojo.ComplexQuery;
import com.generator.service.CartonOutInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class CartonOutInfoServiceImpl implements CartonOutInfoService {
    @Resource
    CartonOutInfoMapper cartonOutInfoMapper;

    @Override
    public List<CartonOutInfo> selectAll() {
        List<CartonOutInfo>list=new ArrayList<CartonOutInfo>();
        list=cartonOutInfoMapper.selectAll();
        return list;
    }

    @Override
    public List<CartonOutInfo> selectAl(List<ComplexQuery> queryList,String bSecondedCustomerString, String startTime, String endTime) {
        return cartonOutInfoMapper.selectAl(queryList,bSecondedCustomerString,startTime,endTime);
    }

    @Override
    public List<CartonOutInfo> selectA(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime) {
        return cartonOutInfoMapper.selectA(cur,rows,sort,order,queryList,startTime,endTime);
    }


    @Override
    public CartonOutInfo selectById(String place) {
        return null;
    }

    @Override
    public int addCOI(CartonOutInfo cartonOutInfo) {
        int num=cartonOutInfoMapper.insertSelective(cartonOutInfo);
        return num;
    }

    @Override
    public int updataCOI(CartonOutInfo cartonOutInfo) {
        return 0;
    }

    @Override
    public int deleteCOI(int id) {
        return 0;
    }

    @Override
    public List<CartonOutInfo> selectByBnumber(String[] deliveryNumber) {
        return cartonOutInfoMapper.selectByDnumbers(deliveryNumber);
    }

    @Override
    public List<CartonOutInfo> selectByQ(String q) {
        return cartonOutInfoMapper.selectByQ(q);
    }

    @Override
    public int updateByNum(String deliveryNumber) {
        int num=cartonOutInfoMapper.updataByNum(deliveryNumber);
        return num;
    }

    @Override
    public List<CartonOutInfo> selects(String q) {
        return cartonOutInfoMapper.selects(q);
    }

    @Override
    public List<CartonOutInfo> getListByPid(String customName) {
        List<CartonOutInfo>list=new ArrayList<CartonOutInfo>();
        list=cartonOutInfoMapper.getListByPid(customName);
        return list;
    }

    @Override
    public List<CartonOutInfo> getList() {
        List<CartonOutInfo>list=new ArrayList<CartonOutInfo>();
        list=cartonOutInfoMapper.getList();
        return list;
    }

    @Override
    public CartonOutInfo selectByDeliveryNumber(String deliveryNumber) {
        return cartonOutInfoMapper.selectByDnumber(deliveryNumber);
    }

    @Override
    public CartonOutInfo findById(String deliveryNumber) {
        CartonOutInfo cartonOutInfo=cartonOutInfoMapper.findById(deliveryNumber);
        return cartonOutInfo;
    }

    @Override
    public List<CartonOutInfo> getListByCus(String customName) {

        return cartonOutInfoMapper.getListByCus(customName);
    }

    @Override
    public List<CartonOutInfo> getListB() {

        return cartonOutInfoMapper.getListB();
    }

    @Override
    public CartonOutInfo findByMaxAccount(String time) {
        return cartonOutInfoMapper.findByMaxAccount(time);
    }

    @Override
    public List<CartonOutInfo> select() {
        return cartonOutInfoMapper.select();
    }

    @Override
    public int updateByid(int id, String deliveryStyle) {

        return cartonOutInfoMapper.updataByid(id,deliveryStyle);
    }
}
