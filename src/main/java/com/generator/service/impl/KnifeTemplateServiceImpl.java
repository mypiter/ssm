package com.generator.service.impl;

import com.generator.mapper.KnifeTemplateMapper;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.KnifeTemplate;
import com.generator.service.KnifeTemplateService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class KnifeTemplateServiceImpl implements KnifeTemplateService {
    @Resource
    KnifeTemplateMapper knifeTemplateMapper;
    @Override
    public int addKnife(KnifeTemplate knifeTemplate) {
        int num=knifeTemplateMapper.insertSelective(knifeTemplate);
        return num;
    }

    @Override
    public List<KnifeTemplate> dropSelect(String q) {
        List<KnifeTemplate>list =new ArrayList<KnifeTemplate>();
        list=knifeTemplateMapper.dropSelect(q);
        return list;
    }

    @Override
    public List<KnifeTemplate> select(int cur, int rows, String sort, String oder, List<ComplexQuery> queryList) {
        return knifeTemplateMapper.select(cur,rows,sort,oder,queryList);
    }

    @Override
    public List<KnifeTemplate> selectAll(List<ComplexQuery> queryList) {
        return knifeTemplateMapper.selectAll(queryList);
    }

    @Override
    public int deleteKnife(int i) {
        return knifeTemplateMapper.deleteByPrimaryKey(i);
    }

    @Override
    public int updateKnife(KnifeTemplate knifeTemplate) {
        return knifeTemplateMapper.updateByPrimaryKeySelective(knifeTemplate);
    }

    @Override
    public KnifeTemplate selectById(int knifeTemplateId) {
        return knifeTemplateMapper.selectByPrimaryKey(knifeTemplateId);
    }
}
