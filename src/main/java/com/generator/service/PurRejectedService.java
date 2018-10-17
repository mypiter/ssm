package com.generator.service;

import com.generator.pojo.ComplexQuery;
import com.generator.pojo.PurRejected;

import java.util.List;

/**
 * 纸板退赔业务
 */
public interface PurRejectedService {
    /**
     * 保存退货赔偿记录
     * @param purRejected
     * @return
     */
    int addPurRejected(PurRejected purRejected);

    /**
     * 加载出所有的纸板退货赔偿记录   分页查询
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
    List<PurRejected> findByPurReturn(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime, String orderAccount);

    /**
     * 加载出所有的纸板退货赔偿记录   查询全部
     * @param queryList
     * @param startTime
     * @param endTime
     * @param orderAccount
     * @return
     */
    List<PurRejected> findByPurReturnAll(List<ComplexQuery> queryList, String startTime, String endTime, String orderAccount);
}
