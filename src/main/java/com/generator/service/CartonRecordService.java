package com.generator.service;

import com.generator.pojo.CartonRecord;
import com.generator.pojo.ComplexQuery;

import java.util.List;

public interface CartonRecordService {

    //查询所有记录layui
    List<CartonRecord> selectAll(List<ComplexQuery> queryList, String startTime, String endTime);
    //查询所有记录
    List<CartonRecord> selectAl(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime);
    //根据订单id查询信息
    CartonRecord selectById(String place);
    //添加记录
    int addCR(CartonRecord cartonStock);
    //修改记录
    int updataCR(CartonRecord cartonStock);

    //根据订单号修改该订单库存
    int updataById(String place,int storgeNum);

    //删除记录
    int deleteCR(int id);

    CartonRecord findById(String orderNumber);
}
