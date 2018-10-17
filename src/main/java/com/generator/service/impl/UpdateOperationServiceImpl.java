package com.generator.service.impl;

import com.generator.mapper.UpdateOperationMapper;
import com.generator.pojo.UpdateOperation;
import com.generator.service.UpdateOperationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UpdateOperationServiceImpl implements UpdateOperationService {
    @Resource
    UpdateOperationMapper updateOperationMapper;
    @Override
    public void addUpdateLog(UpdateOperation log) {
        updateOperationMapper.insertSelective(log);
    }
}
