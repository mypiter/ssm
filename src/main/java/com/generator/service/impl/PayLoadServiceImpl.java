package com.generator.service.impl;


import com.generator.mapper.PaymenttRecordMapper;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.PaymenttRecord;
import com.generator.service.PayLoadService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PayLoadServiceImpl implements PayLoadService {
    @Resource
    PaymenttRecordMapper paymenttRecordMapper;

    @Override
    public int addPay(PaymenttRecord paymenttRecord) {
        int num=paymenttRecordMapper.insertSelective(paymenttRecord);
        return num;
    }

    @Override
    public List<PaymenttRecord> select(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime) {
        return paymenttRecordMapper.select(cur,rows,sort,order,queryList,startTime,endTime);
    }

    @Override
    public List<PaymenttRecord> selectAll(List<ComplexQuery> queryList, String startTime, String endTime) {
        return paymenttRecordMapper.selectAll(queryList,startTime,endTime);
    }

    @Override
    public PaymenttRecord selectById(int paymenttRecordId) {
        return paymenttRecordMapper.selectByPrimaryKey(paymenttRecordId);
    }

    @Override
    public int updatePay(PaymenttRecord paymenttrecord) {
        return paymenttRecordMapper.updateByPrimaryKeySelective(paymenttrecord);
    }
}
