package com.generator.service;

import com.generator.pojo.SupplierMateriala;

import java.util.List;

public interface supplierMaterialAService {
    /**
     * A供应商材质接口
     */
    //根据供应商id查询该材质
    List<SupplierMateriala> findById(int id,int cur,int rows);
    //A类供应商材质登记
    int addSupplierA(SupplierMateriala supplierMateriala);
    //A类供应商材质修改
    int updateSupplierA(SupplierMateriala supplierMateriala);
    //A类供应商材质删除
    int deleteSupplierA(int id);
    //根据本公司代号，代号，楞型
    SupplierMateriala findByCode(String code,String mycode,String pitType);

    /**
     * @param id
     * @param flutType
     * @param ceng
     * @return
     */
    List<SupplierMateriala> findBySu(int id,String flutType,int ceng);

    List<SupplierMateriala> findByAll(int puuid);

    /**
     * 批量删除
     * @param list
     * @return
     */
    int batchDeleteSupplierA(List<SupplierMateriala> list);
}
