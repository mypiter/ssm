package com.generator.service;

import com.generator.pojo.Youhui;

import java.util.List;

/**
 * 供应商优惠接口
 */
public interface YouhuiService {
    //根据供应商id查询优惠信息
    List<Youhui> selectById(int id,int cur,int rows);
    List<Youhui> findAll(int i);
    //供应商优惠登记
    int addYouhui(Youhui youhui);
    //供应商优惠修改
    int updateYouhui(Youhui youhui);
    //供应商优惠删除

    int deleteYouhui(int id);

    List<Youhui> findByC(int sid, int ceng);
}
