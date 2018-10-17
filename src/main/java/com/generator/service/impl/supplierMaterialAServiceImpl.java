package com.generator.service.impl;


import com.generator.mapper.SupplierMaterialaMapper;
import com.generator.pojo.SupplierMateriala;
import com.generator.service.supplierMaterialAService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
@Service
public class supplierMaterialAServiceImpl implements supplierMaterialAService {
    @Resource
    SupplierMaterialaMapper supplierMaterialaMapper;

    @Override
    public List<SupplierMateriala> findById(int id,int cur,int rows) {
        List<SupplierMateriala>list=new ArrayList<SupplierMateriala>();
        list=supplierMaterialaMapper.selectById(id,cur,rows);
        return list;
    }

    @Override
    public int addSupplierA(SupplierMateriala supplierMateriala) {
        int num =supplierMaterialaMapper.insertSelective(supplierMateriala);
        return num;
    }

    @Override
    public int updateSupplierA(SupplierMateriala supplierMateriala) {
        int num =supplierMaterialaMapper.updateByPrimaryKeySelective(supplierMateriala);
        return num;
    }

    @Override
    public int deleteSupplierA(int id) {
        int num=supplierMaterialaMapper.deleteByPrimaryKey(id);
        return num;
    }

    @Override
    public SupplierMateriala findByCode(String code, String mycode, String pitType) {
        return supplierMaterialaMapper.findByCode(code,mycode,pitType);
    }

    @Override
    public List<SupplierMateriala> findBySu(int id, String flutType, int ceng) {

        return supplierMaterialaMapper.findBySu(id,flutType,ceng);
    }

    @Override
    public List<SupplierMateriala> findByAll(int id) {

        return supplierMaterialaMapper.findByAll(id);
    }

    @Override
    public int batchDeleteSupplierA(List<SupplierMateriala> list) {
        return supplierMaterialaMapper.batchDeleteSupplierA(list);
    }
}
