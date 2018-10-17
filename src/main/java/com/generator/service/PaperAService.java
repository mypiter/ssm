package com.generator.service;


import com.generator.pojo.PaperA;

import java.util.List;

/**
 * A类供应商纸张接口
 */
public interface PaperAService {
    //根据供应商id查询该材质
    List<PaperA> selectById(int id,int cur,int rows);
    List<PaperA> findAll(int id);
    //A类供应商材质登记
    int addPaperA(PaperA paperA);
    //A类供应商材质修改
    int updatePaperA(PaperA paperA);
    //A类供应商材质删除
    int deletePaperA(int id);

    //根据纸张代号查找本公司代号
    String selectMyCodeByCo(int supllierId,String strCode);

}
