package com.generator.service.impl;

import com.generator.mapper.CardboardLoanMapper;
import com.generator.pojo.CardboardLoan;
import com.generator.pojo.ComplexQuery;
import com.generator.service.CardboardLoanService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CardboardLoanServiceImpl implements CardboardLoanService {
    @Resource
    private CardboardLoanMapper cardboardLoanMapper;

    @Override
    public int addCarLoanS(List<CardboardLoan> list) {
        return cardboardLoanMapper.addCarLoanS(list);
    }

    @Override
    public List<CardboardLoan> findByCardLoan(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime, String orderAccount) {
        return cardboardLoanMapper.findByCardLoan(cur,rows,sort,order,queryList,startTime,endTime,orderAccount);
    }

    @Override
    public List<CardboardLoan> findByCardLoanAll(List<ComplexQuery> queryList, String startTime, String endTime, String orderAccount) {
        return cardboardLoanMapper.findByCardLoanAll(queryList,startTime,endTime,orderAccount);
    }
}
