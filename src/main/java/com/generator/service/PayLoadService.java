package com.generator.service;

import com.generator.pojo.ComplexQuery;
import com.generator.pojo.PaymenttRecord;

import java.util.List;

public interface PayLoadService {
    int addPay(PaymenttRecord paymenttRecord);

    List<PaymenttRecord> select(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime);

    List<PaymenttRecord> selectAll(List<ComplexQuery> queryList, String startTime, String endTime);

    PaymenttRecord selectById(int paymenttRecordId);

    int updatePay(PaymenttRecord paymenttrecord);
}
