package com.generator.service.impl;

import com.generator.mapper.FlutMapper;
import com.generator.pojo.Flut;
import com.generator.service.FlutTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class FlutTypeServiceImpl implements FlutTypeService {
    @Resource
    FlutMapper flutMapper;

    @Override
    public List<Flut> select() {
        return flutMapper.select();
    }

    @Override
    public int addFT(Flut flut) {
        return flutMapper.insertSelective(flut);
    }

    @Override
    public int updateFT(Flut flut) {
        return flutMapper.updateByPrimaryKeySelective(flut);
    }

    @Override
    public int deleteFT(int id) {
        return flutMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Flut selectById(int id) {
        return flutMapper.selectByPrimaryKey(id);
    }
}
