package com.generator.service.impl;

import com.generator.mapper.DuizhangMapper;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Duizhang;
import com.generator.service.DuizhangService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DuizhangServiceImpl implements DuizhangService {
    @Resource
    DuizhangMapper duizhangMapper;


    @Override
    public int addDz(Duizhang duizhang) {
        return duizhangMapper.insertSelective(duizhang);
    }

    @Override
    public List<Duizhang> dropSelect(String q) {
        return duizhangMapper.dropSelect(q);
    }

    @Override
    public List<Duizhang> select(int cur, int rows, String sort, String oder, List<ComplexQuery> queryList) {
        return duizhangMapper.select(cur,rows,sort,oder,queryList);
    }

    @Override
    public List<Duizhang> selectAll(List<ComplexQuery> queryList) {
        return duizhangMapper.selectAll(queryList);
    }

    @Override
    public int deleteDz(int i) {
        return duizhangMapper.deleteByPrimaryKey(i);
    }

    @Override
    public int updateDz(Duizhang duizhang) {
        return duizhangMapper.updateByPrimaryKeySelective(duizhang);
    }

    @Override
    public Duizhang findById(int id) {
        return duizhangMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Duizhang> getList() {
        return duizhangMapper.getList();
    }
}
