package com.generator.service.impl;

import com.generator.mapper.CardboardEditMapper;
import com.generator.pojo.CardboardEdit;
import com.generator.pojo.ComplexQuery;
import com.generator.service.CardboardEditService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CardboardEditServiceImpl implements CardboardEditService {
    @Resource
    private CardboardEditMapper cardboardEditMapper;

    @Override
    public int addCardEditS(List<CardboardEdit> list) {
        return cardboardEditMapper.addCardEditS(list);
    }

    @Override
    public List<CardboardEdit> findByPurEdit(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime, String orderAccount) {
        return cardboardEditMapper.findByPurEdit(cur,rows,sort,order,queryList,startTime,endTime,orderAccount);
    }

    @Override
    public List<CardboardEdit> findByPurEditAll(List<ComplexQuery> queryList, String startTime, String endTime, String orderAccount) {
        return cardboardEditMapper.findByPurEditAll(queryList,startTime,endTime,orderAccount);
    }
}
