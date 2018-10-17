package com.generator.service;

import com.generator.pojo.CardboardEnter;
import com.generator.pojo.CartonPurchase;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.StorageLabel;

import java.util.List;

/**
 * 采购单入库业务
 */
public interface CardboardEnterService {
    /**
     * 新增入库记录
     * @param cardboardEnter
     * @return
     */
    int addCarEnterRecord(CardboardEnter cardboardEnter);

    /**
     * 批量添加入库记录
     * @param list
     * @return
     */
    int addCarEnterRecordS(List<CardboardEnter> list);

    /**
     * 纸板入库记录报表 分页查询
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
    List<CardboardEnter> findByPurEnter(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime, String orderAccount);

    /**
     * 纸板入库记录报表 查询全部记录
     * @param queryList
     * @param startTime
     * @param endTime
     * @param orderAccount
     * @return
     */
    List<CardboardEnter> findByPurEnterAll(List<ComplexQuery> queryList, String startTime, String endTime, String orderAccount);

    /**
     * 加载退货数不为0的 纸板入库记录 并且id降序查询
     * @param q
     * @return
     */
    List<CardboardEnter> dropSelectPurEnter(String q);

    /**
     * 根据采购单号和订单号查询出纸板入库记录
     * @param purchaseAccount
     * @param orderAccount
     * @return
     */
    List<CardboardEnter> findByPurOO(String purchaseAccount, String orderAccount);

    /**
     * 获取数据库中当天的最大入库批号
     * @param time1
     * @return
     */
    CardboardEnter getMaxEnterOrder(String time1);

    /**
     * 根据入库id查找出多个入库标签数据
     * @param list
     * @return
     */
    List<StorageLabel> getListByPurId(List<CardboardEnter> list);
}
