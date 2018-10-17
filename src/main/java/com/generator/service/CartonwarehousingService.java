package com.generator.service;

import com.generator.pojo.CartonOutInfo;
import com.generator.pojo.Cartonwarehousing;
import com.generator.pojo.StorageLabel;

import java.util.List;

public interface CartonwarehousingService {
    //根据供应商id查询
    List<Cartonwarehousing> selectById(int id);
    //质登记
    int addCh(Cartonwarehousing ch);
    //修改
    int updataCh(Cartonwarehousing ch);
    //删除
    int deleteCh(int id);
    //根据库存查询入库记录
    List<Cartonwarehousing> selectByRu(String orderAccount);

    Cartonwarehousing findByMaxAccount(String time);

    List<Cartonwarehousing> getListByPurId(int[] rk);
}
