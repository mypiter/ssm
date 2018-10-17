package com.generator.service;


import com.generator.pojo.CartonOutInfo;
import com.generator.pojo.Cartonout;

import java.util.List;

/**
 * 纸箱出库（配送）接口
 */
public interface CartonoutService {
    //查询所有记录
    List<Cartonout> selectAll();

    //根据订单id查询信息
    Cartonout selectById(String place);
    //添加记录
    int addCO(List<Cartonout> list);
    //修改记录
    int updataCO(Cartonout cartonout);

    //根据订单号修改该订单库存
    int updataById(String place,int storgeNum);

    //删除记录
    int deleteCO(int id);

    //跟据送货单号查询订单
    List<Cartonout> selectByNums(String [] deliveryNumber);

    List<Cartonout> selectByNum(String deliveryNumber);

    int updateByD(List<Cartonout> list);

    List<Cartonout> selectByD(String deliveryNumber);

    List<Cartonout> selectByTopjui(String orderAccount);

    //根据客户名称，查询该客户已签收订单
    List<Cartonout> selectByCus(List<CartonOutInfo> list);

    //对账单查询
    List<Cartonout> selectDui(String custom,String stratime,String endtime);


}
