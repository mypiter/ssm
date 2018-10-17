package com.generator.service.impl;

import com.generator.mapper.CartonRecordMapper;
import com.generator.pojo.CartonRecord;
import com.generator.pojo.ComplexQuery;
import com.generator.service.CartonRecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class CartonRecordServiceImpl implements CartonRecordService {
    @Resource
    CartonRecordMapper cartonRecordMapper;

    @Override
    public List<CartonRecord> selectAll(List<ComplexQuery> queryList, String startTime, String endTime) {

        return cartonRecordMapper.selectAll(queryList,startTime,endTime);
    }

    @Override
    public List<CartonRecord> selectAl(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime) {
        return cartonRecordMapper.selectAl(cur,rows,sort,order,queryList,startTime,endTime);
    }

    @Override
    public CartonRecord selectById(String place) {
        return null;
    }

    @Override
    public int addCR(CartonRecord cartonStock) {
        int num=cartonRecordMapper.insertSelective(cartonStock);
        return num;
    }

    @Override
    public int updataCR(CartonRecord cartonStock) {
        return 0;
    }

    @Override
    public int updataById(String place, int storgeNum) {
        return 0;
    }

    @Override
    public int deleteCR(int id) {
        return 0;
    }

    @Override
    public CartonRecord findById(String orderNumber) {
        return cartonRecordMapper.findById(orderNumber);
    }
}
