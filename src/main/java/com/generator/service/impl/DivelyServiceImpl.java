package com.generator.service.impl;

import com.generator.mapper.DivelyMapper;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Dively;
import com.generator.service.DivelyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DivelyServiceImpl implements DivelyService {
    @Resource
    DivelyMapper divelyMapper;

    @Override
    public int addDiv(Dively dively) {

        return divelyMapper.insertSelective(dively);
    }

    @Override
    public List<Dively> dropSelect(String q) {
        return divelyMapper.dropSelect(q);
    }

    @Override
    public List<Dively> select(int cur, int rows, String sort, String oder, List<ComplexQuery> queryList) {
        return divelyMapper.select(cur,rows,sort,oder,queryList);
    }

    @Override
    public List<Dively> selectAll(List<ComplexQuery> queryList) {
        return divelyMapper.selectAll(queryList);
    }

    @Override
    public int deleteDiv(int i) {
        return divelyMapper.deleteByPrimaryKey(i);
    }

    @Override
    public int updateDiv(Dively dively) {
        return divelyMapper.updateByPrimaryKeySelective(dively);
    }

    @Override
    public Dively findById(int id) {
        return divelyMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Dively> getList(int biao) {
        return divelyMapper.getList(biao);
    }
}
