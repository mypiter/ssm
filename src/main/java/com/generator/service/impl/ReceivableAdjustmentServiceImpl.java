package com.generator.service.impl;

import com.generator.mapper.ReceivableAdjustmentMapper;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.ReceivableAdjustment;
import com.generator.service.ReceivableAdjustmentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ReceivableAdjustmentServiceImpl implements ReceivableAdjustmentService {
    @Resource
    ReceivableAdjustmentMapper receivableAdjustmentMapper;

    @Override
    public int addReceivable(ReceivableAdjustment receivableAdjustment) {
        return receivableAdjustmentMapper.insertSelective(receivableAdjustment);
    }

    @Override
    public List<ReceivableAdjustment> loadReceivableList(int cur, int rows, String sort, String order, List<ComplexQuery> queryList) {
        return receivableAdjustmentMapper.loadReceivableList(cur,rows, sort,order, queryList);
    }

    @Override
    public List<ReceivableAdjustment> loadReceivableListAll(List<ComplexQuery> queryList) {
        return receivableAdjustmentMapper.loadReceivableListAll(queryList);
    }
}
