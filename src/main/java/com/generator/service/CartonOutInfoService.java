package com.generator.service;


import com.generator.pojo.CartonOutInfo;
import com.generator.pojo.CartonRecord;
import com.generator.pojo.ComplexQuery;

import java.util.List;

//配送信息接口
public interface CartonOutInfoService {

    //查询所有记录
    List<CartonOutInfo> selectAll();

    List<CartonOutInfo> selectAl(List<ComplexQuery> queryList,String bSecondedCustomerString ,String startTime, String endTime);
    //查询所有记录
    List<CartonOutInfo> selectA(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime);
    //根据订单id查询信息
    CartonOutInfo selectById(String place);
    //添加记录
    int addCOI(CartonOutInfo cartonOutInfo);
    //修改记录
    int updataCOI(CartonOutInfo cartonOutInfo);

    //删除记录
    int deleteCOI(int id);
    //送货单报表
    List<CartonOutInfo> selectByBnumber(String[] deliveryNumber);
    //下拉框查询
    List<CartonOutInfo> selectByQ(String q);

    //根据送货单号修改送货单状态
    int updateByNum(String deliveryNumber);


    List<CartonOutInfo> selects(String q);

    List<CartonOutInfo> getListByPid(String customName);

    List<CartonOutInfo> getList();

    CartonOutInfo selectByDeliveryNumber(String deliveryNumber);

    CartonOutInfo findById(String deliveryNumber);

    List<CartonOutInfo> getListByCus(String customName);
    //查询所有已签收客户
    List<CartonOutInfo> getListB();

    CartonOutInfo findByMaxAccount(String time);
    //查询配送完成的客户
    List<CartonOutInfo> select();
    //根据id修改送货单样式
    int updateByid(int id, String deliveryStyle);
}
