package com.generator.service.impl;

import com.generator.mapper.FinancialRegistrationMapper;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Custom;
import com.generator.pojo.FinancialRegistration;
import com.generator.pojo.ReceiptRecord;
import com.generator.service.FinancialRegistrationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FinancialRegistrationServiceImpl implements FinancialRegistrationService {
    @Resource
    FinancialRegistrationMapper financialRegistrationMapper;

    @Override
    public int addPay(FinancialRegistration finan) {
        int mun=financialRegistrationMapper.insertSelective(finan);
        return mun;
    }

    @Override
    public int addLoanTwo(FinancialRegistration finan) {
        int mun=financialRegistrationMapper.insertSelective(finan);
        return mun;
    }

    @Override
    public List<FinancialRegistration> select(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime) {
        return financialRegistrationMapper.select(cur,rows,sort,order,queryList,startTime,endTime);
    }

    @Override
    public List<FinancialRegistration> selectAll(List<ComplexQuery> queryList, String startTime, String endTime) {
        return financialRegistrationMapper.selectAll(queryList,startTime,endTime);
    }

    @Override
    public int addFinancial(FinancialRegistration financialRegistration) {
        return financialRegistrationMapper.insertSelective(financialRegistration);
    }

    @Override
    public int deleteFinancial(int i) {
        return financialRegistrationMapper.deleteByPrimaryKey(i);
    }

    @Override
    public int updateFinancial(FinancialRegistration financialRegistration) {
        return financialRegistrationMapper.updateByPrimaryKeySelective(financialRegistration);
    }

    @Override
    public FinancialRegistration findById(int financialRegistrationId) {
        return financialRegistrationMapper.selectByPrimaryKey(financialRegistrationId);
    }

}
