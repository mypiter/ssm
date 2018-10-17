package com.generator.service.impl;

import com.generator.mapper.OperationRecordMapper;
import com.generator.pojo.OperationRecord;
import com.generator.service.OperationRecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class OperationRecordServiceImpl implements OperationRecordService {
    @Resource
    OperationRecordMapper operationRecordMapper;

    @Override
    public void addOperationLog(OperationRecord log) {
        operationRecordMapper.insertSelective(log);
    }
}
