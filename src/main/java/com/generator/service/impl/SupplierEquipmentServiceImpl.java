package com.generator.service.impl;

import com.generator.mapper.SupplierEquipmentMapper;
import com.generator.pojo.SupplierEquipment;
import com.generator.service.SupplierEquipmentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class SupplierEquipmentServiceImpl implements SupplierEquipmentService {

    @Resource
    SupplierEquipmentMapper supplierEquipmentMapper;
    @Override
    public List<SupplierEquipment> selectById(int id,int cur,int rows) {
        List<SupplierEquipment>list=new ArrayList<SupplierEquipment>();
        list=supplierEquipmentMapper.selectById(id,cur,rows);
        return list;
    }

    @Override
    public List<SupplierEquipment> findAll(int id) {
        return supplierEquipmentMapper.findAll(id);
    }

    @Override
    public int addEquipment(SupplierEquipment supplierEquipment) {
        int num=supplierEquipmentMapper.insertSelective(supplierEquipment);
        return num;
    }

    @Override
    public int updateEquipment(SupplierEquipment supplierEquipment) {
        int num = supplierEquipmentMapper.updateByPrimaryKeySelective(supplierEquipment);
        return num;
    }

    @Override
    public int deleteEquipment(int id) {
        int num=supplierEquipmentMapper.deleteByPrimaryKey(id);
        return num;
    }
}
