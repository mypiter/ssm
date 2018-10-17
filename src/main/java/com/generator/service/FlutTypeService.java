package com.generator.service;

import com.generator.pojo.Flut;

import java.util.List;

public interface FlutTypeService {
    //根据供应商id查询工序信息
    List<Flut> select();
    //工序登记
    int addFT(Flut flut);
    //工序修改
    int updateFT(Flut flut);
    //工序删除
    int deleteFT(int id);
    //根据id查询工序
    Flut selectById(int id);


}
