package com.generator.service;

import com.generator.pojo.CartonSupplier;

import java.util.List;

public interface CartonSupplierService {
    //添加供应商接口
    int insertSupperlier(CartonSupplier cs);
    //查询所有供应商
    List<CartonSupplier>  select();
    //供应商信息修改、
    int update(CartonSupplier cs);
    //根据供应商id查询供应商
    CartonSupplier selectById(int SupplierId);
    //根据id删除供应商
    int delete(int id);

    /**
     * 供应商下拉框查询
     * @param q
     * @return
     */
    List<CartonSupplier> dropSelect(String q);

}
