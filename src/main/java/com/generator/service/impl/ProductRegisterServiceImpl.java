package com.generator.service.impl;

import com.generator.mapper.CartonplantModel2Mapper;
import com.generator.pojo.CartonplantModel2;
import com.generator.pojo.ComplexQuery;
import com.generator.service.ProductRegisterService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProductRegisterServiceImpl implements ProductRegisterService {
    @Resource
    CartonplantModel2Mapper cartonplantModel2Mapper;

    @Override
    public int addProductRegister(CartonplantModel2 cartonplantModel2) {
        int num=cartonplantModel2Mapper.insertSelective(cartonplantModel2);
        return num;
    }

    @Override
    public List<CartonplantModel2> select(int cur, int rows, String sort, String oder, List<ComplexQuery> queryList) {
        return cartonplantModel2Mapper.select(cur,rows,sort,oder,queryList);
    }

    @Override
    public List<CartonplantModel2> selectAll(List<ComplexQuery> queryList) {
        return cartonplantModel2Mapper.selectAll(queryList);
    }

    @Override
    public CartonplantModel2 selectById(int cartonId) {
        return cartonplantModel2Mapper.selectByPrimaryKey(cartonId);
    }

    @Override
    public int updateProduct(CartonplantModel2 cartonplantModel2) {
        return cartonplantModel2Mapper.updateByPrimaryKeySelective(cartonplantModel2);
    }

    @Override
    public int deleteProduct(int i) {
        return cartonplantModel2Mapper.deleteByPrimaryKey(i);
    }

    @Override
    public List<CartonplantModel2> dropSelect(String q) {
        return cartonplantModel2Mapper.dropSelect(q);
    }

    @Override
    public List<CartonplantModel2> findByPitId(int i) {
        return cartonplantModel2Mapper.findByPitId(i);
    }
}
