package com.generator.service;

import com.generator.pojo.WorkingProcedure;

import java.util.List;

public interface WorkingProcedureService {
    //根据供应商id查询工序信息
    List<WorkingProcedure> select();
    //工序登记
    int addWP(WorkingProcedure workingProcedure);
    //工序修改
    int updateWP(WorkingProcedure workingProcedure);
    //工序删除
    int deleteWP(int id);
    //根据id查询工序
    WorkingProcedure selectById(int id);
    //根据code查询工工序
    List<WorkingProcedure> selectByco(String [] str);

}
