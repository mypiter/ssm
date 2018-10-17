package com.generator.service.impl;

import com.generator.mapper.PaperChangeMapper;
import com.generator.pojo.PaperChange;
import com.generator.service.PaperChangeService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class PaperChangeServiceImpl implements PaperChangeService {
    @Resource
    PaperChangeMapper paperChangeMapper;
    @Override
    public List<PaperChange> selectById(int id,int cur,int rows) {
        List<PaperChange> list=new ArrayList<PaperChange>();
        list=paperChangeMapper.selectById(id,cur,rows);
        return list;
    }

    @Override
    public List<PaperChange> findAll(int id) {
        return paperChangeMapper.findAll(id);
    }

    @Override
    public int addPaper(PaperChange paperChange) {
        int num=paperChangeMapper.insertSelective(paperChange);
        return num;
    }

    @Override
    public int updatePaper(PaperChange paperChange) {
        int num =paperChangeMapper.updateByPrimaryKeySelective(paperChange);
        return num;
    }

    @Override
    public int deleteYPaper(int id) {
        int num=paperChangeMapper.deleteByPrimaryKey(id);
        return num;
    }

    @Override
    public List<PaperChange> selectPrice(String yz, String th) {
        List<PaperChange> list=new ArrayList<PaperChange>();
        list=paperChangeMapper.selectBy(yz,th);
        return list;
    }
}
