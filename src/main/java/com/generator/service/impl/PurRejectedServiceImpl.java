package com.generator.service.impl;

import com.generator.mapper.PurRejectedMapper;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.PurRejected;
import com.generator.service.PurRejectedService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PurRejectedServiceImpl implements PurRejectedService {
    @Resource
    private PurRejectedMapper purRejectedMapper;

    @Override
    public int addPurRejected(PurRejected purRejected) {
        return purRejectedMapper.insert(purRejected);
    }

    @Override
    public List<PurRejected> findByPurReturn(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime, String orderAccount) {
        return purRejectedMapper.findByPurReturn(cur,rows,sort,order,queryList,startTime,endTime,orderAccount);
    }

    @Override
    public List<PurRejected> findByPurReturnAll(List<ComplexQuery> queryList, String startTime, String endTime, String orderAccount) {
        return purRejectedMapper.findByPurReturnAll(queryList,startTime,endTime,orderAccount);
    }
}
