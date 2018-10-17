package com.generator.service;

import com.generator.pojo.CardboardLoan;
import com.generator.pojo.ComplexQuery;

import java.util.List;

public interface CardboardLoanService {
    /**
     * 新增纸板使用调整
     * @param list
     * @return
     */
    int addCarLoanS(List<CardboardLoan> list);

    /**
     *查询所有的库存借调记录   分页查询
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
    List<CardboardLoan> findByCardLoan(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime, String orderAccount);

    /**
     *查询所有的库存借调记录   查询所有
     * @param queryList
     * @param startTime
     * @param endTime
     * @param orderAccount
     * @return
     */
    List<CardboardLoan> findByCardLoanAll(List<ComplexQuery> queryList, String startTime, String endTime, String orderAccount);
}
