package com.generator.service.impl;

import com.generator.mapper.ReceiptRecordMapper;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.ReceiptRecord;
import com.generator.service.LoanBackByReceiptRecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class LoanBackByReceiptRecordServiceImpl implements LoanBackByReceiptRecordService {
    @Resource
    ReceiptRecordMapper receiptRecordMapper;

    @Override
    public int addLoan(ReceiptRecord receiptRecord) {
        int num = receiptRecordMapper.insertSelective(receiptRecord);
        return num;
    }

    @Override
    public List<ReceiptRecord> select(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime) {
        return receiptRecordMapper.select(cur,rows,sort,order,queryList,startTime,endTime);
    }

    @Override
    public List<ReceiptRecord> selectAll(List<ComplexQuery> queryList, String startTime, String endTime) {
        return receiptRecordMapper.selectAll(queryList,startTime,endTime);
    }

    @Override
    public ReceiptRecord selectById(int receiptRecordId) {
        return receiptRecordMapper.selectByPrimaryKey(receiptRecordId);
    }

    @Override
    public int updateLoan(ReceiptRecord receiptRecord) {
        return receiptRecordMapper.updateByPrimaryKeySelective(receiptRecord);
    }
}
