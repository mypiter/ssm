package com.generator.service;


import com.generator.pojo.CartonLoan;
import com.generator.pojo.ComplexQuery;

import java.util.List;

/**
 * 成品借调接口
 */
public interface CartonLoanService {
    //查询
    List<CartonLoan> selectById(int id);
    //登记
    int addLoan(CartonLoan cartonLoan);
    //修改
    int updataLoan(CartonLoan cartonLoan);
    //删除
    int deleteLoan(int id);


    List<CartonLoan> selectTopjui(int cur, int rows, String sort, String order, List<ComplexQuery> queryList,String startTime,String endTime);

    List<CartonLoan> selectTop(List<ComplexQuery> queryList,String startTime,String endTime);

    List<CartonLoan> findByNum(String orderAccount);
}
