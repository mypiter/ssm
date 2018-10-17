package com.generator.service.impl;

import com.generator.mapper.RejectedMapper;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Rejected;
import com.generator.service.RejectedService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RejectedServiceImpl implements RejectedService {
    @Resource
    private RejectedMapper rejectedMapper;

    @Override
    public int addRejected(Rejected rejected) {
        return rejectedMapper.insertSelective(rejected);
    }

    @Override
    public List<Rejected> select(int cur, int rows, String sort, String oder, List<ComplexQuery> queryList) {
        return rejectedMapper.select(cur, rows, sort, oder, queryList);
    }

    @Override
    public List<Rejected> selectAll(List<ComplexQuery> queryList) {
        return rejectedMapper.selectAll(queryList);
    }

    @Override
    public int deleteRejected(int sss) {
        return rejectedMapper.deleteByPrimaryKey(sss);
    }

    @Override
    public Rejected selectById(int rejectedId) {
        return rejectedMapper.selectByPrimaryKey(rejectedId);
    }

    @Override
    public int updateRejected(Rejected rejected) {
        return rejectedMapper.updateByPrimaryKeySelective(rejected);
    }
}
