package com.generator.service.impl;

import com.generator.mapper.CartonSupplierMapper;
import com.generator.pojo.CartonSupplier;
import com.generator.service.CartonSupplierService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class CartonSupplierServiceImpl implements CartonSupplierService {

    @Resource
    CartonSupplierMapper cartonSupplierMapper;

    @Override
    public int insertSupperlier(CartonSupplier cs) {
        int num=cartonSupplierMapper.insertSelective(cs);
        return num;
    }

    @Override
    public List<CartonSupplier> select() {
        List<CartonSupplier>list =new ArrayList<CartonSupplier>();
        list=cartonSupplierMapper.selects();
        return list;
    }

    @Override
    public int update(CartonSupplier cs) {
        int num=cartonSupplierMapper.updateByPrimaryKey(cs);
        return num;
    }

    @Override
    public CartonSupplier selectById(int SupplierId) {
        CartonSupplier cartonSupplier=new CartonSupplier();
        cartonSupplier=cartonSupplierMapper.selectByPrimaryKey(SupplierId);
        return cartonSupplier;
    }

    @Override
    public int delete(int id) {
        int num=cartonSupplierMapper.deleteByPrimaryKey(id);
        return num;
    }

    @Override
    public List<CartonSupplier> dropSelect(String q) {
        return cartonSupplierMapper.dropSelect(q);
    }
}
