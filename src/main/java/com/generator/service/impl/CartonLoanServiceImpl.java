package com.generator.service.impl;

import com.generator.mapper.CartonLoanMapper;
import com.generator.pojo.CartonLoan;
import com.generator.pojo.ComplexQuery;
import com.generator.service.CartonLoanService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CartonLoanServiceImpl implements CartonLoanService {

    @Resource
    CartonLoanMapper cartonLoanMapper;

    @Override
    public List<CartonLoan> selectById(int id) {
        return null;
    }

    @Override
    public int addLoan(CartonLoan cartonLoan) {
        return cartonLoanMapper.insertSelective(cartonLoan);
    }

    @Override
    public int updataLoan(CartonLoan cartonLoan) {
        return 0;
    }

    @Override
    public int deleteLoan(int id) {
        return 0;
    }

    @Override
    public List<CartonLoan> selectTopjui(int cur, int rows, String sort, String order, List<ComplexQuery> queryList,String startTime,String endTime) {
        return cartonLoanMapper.selectTopjui(cur,rows,sort,order,queryList,startTime,endTime);
    }

    @Override
    public List<CartonLoan> selectTop(List<ComplexQuery> queryList,String startTime,String endTime) {
        return cartonLoanMapper.selectTop(queryList,startTime,endTime);
    }

    @Override
    public List<CartonLoan> findByNum(String orderAccount) {
        return cartonLoanMapper.findByNum(orderAccount);
    }
}
