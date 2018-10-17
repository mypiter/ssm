package com.generator.service.impl;


import com.generator.mapper.CartonoutMapper;
import com.generator.pojo.CartonOutInfo;
import com.generator.pojo.Cartonout;
import com.generator.service.CartonoutService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class CartonoutServiceImpl implements CartonoutService {
    @Resource
    CartonoutMapper cartonoutMapper;
    @Override
    public List<Cartonout> selectAll() {
        List<Cartonout>list =new ArrayList<Cartonout>();
        //list=cartonoutMapper.selectAll();
        return list;
    }

    @Override
    public Cartonout selectById(String place) {
        return null;
    }

    @Override
    public int addCO(List<Cartonout> list) {
        int num=cartonoutMapper.addCO(list);
        return num;
    }

    @Override
    public int updataCO(Cartonout cartonout) {
        return 0;
    }

    @Override
    public int updataById(String place, int storgeNum) {
        return 0;
    }

    @Override
    public int deleteCO(int id) {
        return 0;
    }

    @Override
    public List<Cartonout> selectByNums(String [] deliveryNumber) {
        List<Cartonout>list =new ArrayList<Cartonout>();
        list=cartonoutMapper.selectByNums(deliveryNumber);
        return list;
    }

    @Override
    public List<Cartonout> selectByNum(String deliveryNumber) {
        return cartonoutMapper.selectByNum(deliveryNumber);
    }

    @Override
    public int updateByD(List<Cartonout> list) {
        int num=cartonoutMapper.updataByD(list);
        return num;
    }

    @Override
    public List<Cartonout> selectByD(String deliveryNumber) {

        return cartonoutMapper.selectByD(deliveryNumber);
    }

    @Override
    public List<Cartonout> selectByTopjui(String orderAccount) {
        return cartonoutMapper.selectByTopjui(orderAccount);
    }

    @Override
    public List<Cartonout> selectByCus(List<CartonOutInfo> list) {

        return cartonoutMapper.selectByCus(list);
    }

    @Override
    public List<Cartonout> selectDui(String custom, String stratime, String endtime) {
        return cartonoutMapper.selectDui(custom,stratime,endtime);
    }
}
