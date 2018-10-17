package com.generator.service;

import com.generator.pojo.CardboardEdit;
import com.generator.pojo.ComplexQuery;

import java.util.List;

public interface CardboardEditService {
    /**
     * 批量添加调整记录
     * @param list
     * @return
     */
    int addCardEditS(List<CardboardEdit> list);

    /**
     * 纸板库存调整列表 查询出所有的库存调整记录    分页查询
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
    List<CardboardEdit> findByPurEdit(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime, String orderAccount);

    /**
     * 纸板库存调整列表 查询出所有的库存调整记录   查询全部
     * @param queryList
     * @param startTime
     * @param endTime
     * @param orderAccount
     * @return
     */
    List<CardboardEdit> findByPurEditAll(List<ComplexQuery> queryList, String startTime, String endTime, String orderAccount);
}
