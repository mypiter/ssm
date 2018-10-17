package com.generator.service.impl;

import com.generator.mapper.YouhuiMapper;
import com.generator.pojo.Youhui;
import com.generator.service.YouhuiService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class YouhuiServiceImpl implements YouhuiService {
    @Resource
    YouhuiMapper youhuiMapper;
    @Override
    public List<Youhui> selectById(int id,int cur,int rows) {
        List<Youhui>list=new ArrayList<Youhui>();
        list=youhuiMapper.selectById(id,cur,rows);
        return list;
    }

    @Override
    public List<Youhui> findAll(int i) {
        return youhuiMapper.findAll(i);
    }

    @Override
    public int addYouhui(Youhui youhui) {
        int num=youhuiMapper.insertSelective(youhui);
        return num;
    }

    @Override
    public int updateYouhui(Youhui youhui) {
        int num=youhuiMapper.updateByPrimaryKeySelective(youhui);
        return num;
    }

    @Override
    public int deleteYouhui(int id) {
        int num = youhuiMapper.deleteByPrimaryKey(id);
        return num;
    }

    @Override
    public List<Youhui> findByC(int sid, int ceng) {
        return youhuiMapper.findByC(sid,ceng);
    }
}
