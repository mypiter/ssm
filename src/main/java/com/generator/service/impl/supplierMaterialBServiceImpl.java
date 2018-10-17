package com.generator.service.impl;


import com.generator.mapper.SupplierMaterialbMapper;
import com.generator.pojo.SupplierMaterialb;
import com.generator.service.supplierMaterialBService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class supplierMaterialBServiceImpl implements supplierMaterialBService {
    @Resource
    SupplierMaterialbMapper supplierMaterialbMapper;


    @Override
    public List<SupplierMaterialb> findById(int id,int cur,int rows) {
        List<SupplierMaterialb> list=new ArrayList<SupplierMaterialb>();
        list=supplierMaterialbMapper.selectById(id,cur,rows);
        return list;
    }

    @Override
    public int addSupplierB(SupplierMaterialb supplierMaterialb) {
        int num=supplierMaterialbMapper.insertSelective(supplierMaterialb);
        return num;
    }

    @Override
    public int updateSupplierB(SupplierMaterialb supplierMaterialb) {
        int num=supplierMaterialbMapper.updateByPrimaryKey(supplierMaterialb);
        return num;
    }

    @Override
    public int deleteSupplierB(int id) {
        int num=supplierMaterialbMapper.deleteByPrimaryKey(id);
        return num;
    }

    @Override
    public SupplierMaterialb findByMaterialb(int id,String myCode) {
        return supplierMaterialbMapper.findByMaterialb(id,myCode);
    }

    @Override
    public List<SupplierMaterialb> findByAll(int id) {
        return supplierMaterialbMapper.findByAll(id);
    }

    @Override
    public int batchDeleteSupplierB(List<SupplierMaterialb> list) {
        return supplierMaterialbMapper.batchDeleteSupplierB(list);
    }
}
