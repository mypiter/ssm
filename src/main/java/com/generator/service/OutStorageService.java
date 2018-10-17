package com.generator.service;

import com.generator.pojo.ComplexQuery;
import com.generator.pojo.OutStorage;

import java.util.List;

public interface OutStorageService {
    //查询记录
    List<OutStorage> selectAll(int cur,int limit,String orderAccount,String purchaseSpec,String fluteType,String chang,String k,String minNum,String maxNum);
    //根据pur_id修改记录入库状态
    int  updateOut(int pur_id,int rk);
    //根据pur_id查询
    OutStorage selectById(int pur_id);

    /**
     * 批量添加出库记录
     * @param list
     * @return
     */
    int addOutStoragerS(List<OutStorage> list);

    /**
     * 纸板出库记录报表  查询出所有的出库记录 分页
     * @param cur
     * @param rows
     * @param sort
     * @param order
     * @param queryList
     * @param startTime
     * @param endTime
     * @param orderAccount
     * @return
     */
    List<OutStorage> findByPurOut(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime,String orderAccount);

    /**
     * 纸板出库记录报表  查询出所有的出库记录 查询全部
     * @param queryList
     * @param startTime
     * @param endTime
     * @param orderAccount
     * @return
     */
    List<OutStorage> findByPurOutAll(List<ComplexQuery> queryList, String startTime, String endTime,String orderAccount);

    /**
     * 初始化纸板出库批号
     * @param time1
     * @return
     */
    OutStorage getMaxOutStorAccount(String time1);
}
