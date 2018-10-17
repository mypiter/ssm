package com.generator.service;

import com.generator.pojo.SupplierMaterialb;

import java.util.List;

public interface supplierMaterialBService {
    //根据供应商id查询该材质
    List<SupplierMaterialb> findById(int id,int cur,int rows);
    //B类供应商材质登记
    int addSupplierB(SupplierMaterialb supplierMaterialb);
    //B类供应商材质修改
    int updateSupplierB(SupplierMaterialb supplierMaterialb);
    //B类供应商材质删除
    int deleteSupplierB(int id);
    SupplierMaterialb findByMaterialb(int id,String myCode);
    List<SupplierMaterialb> findByAll(int id);

    /**
     * 批量删除
     * @param list
     * @return
     */
    int batchDeleteSupplierB(List<SupplierMaterialb> list);
}
