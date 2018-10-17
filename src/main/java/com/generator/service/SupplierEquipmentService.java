package com.generator.service;


import com.generator.pojo.SupplierEquipment;

import java.util.List;

/**
 * 供应商设备接口
 */
public interface SupplierEquipmentService {
    //根据供应商id查询换纸信息
    List<SupplierEquipment> selectById(int id,int cur,int rows);
    List<SupplierEquipment> findAll(int id);
    //供应商换纸登记
    int addEquipment(SupplierEquipment supplierEquipment);
    //供应商换纸修改
    int updateEquipment(SupplierEquipment supplierEquipment);
    //供应商换纸删除
    int deleteEquipment(int id);
}
