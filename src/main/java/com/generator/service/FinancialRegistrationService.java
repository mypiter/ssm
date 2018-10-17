package com.generator.service;

import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Custom;
import com.generator.pojo.FinancialRegistration;

import java.util.List;

public interface FinancialRegistrationService {
    int addPay(FinancialRegistration finan);

    int addLoanTwo(FinancialRegistration finan);

    List<FinancialRegistration> select(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime);

    List<FinancialRegistration> selectAll(List<ComplexQuery> queryList, String startTime, String endTime);

    int addFinancial(FinancialRegistration financialRegistration);

    int deleteFinancial(int i);

    int updateFinancial(FinancialRegistration financialRegistration);

    FinancialRegistration findById(int financialRegistrationId);
}
