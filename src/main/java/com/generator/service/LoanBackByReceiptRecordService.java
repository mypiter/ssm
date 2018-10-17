package com.generator.service;


import com.generator.pojo.ComplexQuery;
import com.generator.pojo.ReceiptRecord;

import java.util.List;

public interface LoanBackByReceiptRecordService {

    int addLoan(ReceiptRecord receiptRecord);

    List<ReceiptRecord> select(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime);

    List<ReceiptRecord> selectAll(List<ComplexQuery> queryList, String startTime, String endTime);

    ReceiptRecord selectById(int receiptRecordId);

    int updateLoan(ReceiptRecord receiptRecord);
}
