package com.generator.service.impl;

import com.generator.mapper.CardboardEnterMapper;
import com.generator.pojo.CardboardEnter;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.StorageLabel;
import com.generator.service.CardboardEnterService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CardboardEnterServiceImpl implements CardboardEnterService {
    @Resource
    private CardboardEnterMapper cardboardEnterMapper;
    @Override
    public int addCarEnterRecord(CardboardEnter cardboardEnter) {
        return cardboardEnterMapper.insertSelective(cardboardEnter);
    }

    @Override
    public int addCarEnterRecordS(List<CardboardEnter> list) {
        return cardboardEnterMapper.addCarEnterRecordS(list);
    }

    @Override
    public List<CardboardEnter> findByPurEnter(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime,String orderAccount) {
        return cardboardEnterMapper.findByPurEnter(cur,rows,sort,order,queryList,startTime,endTime,orderAccount);
    }

    @Override
    public List<CardboardEnter> findByPurEnterAll(List<ComplexQuery> queryList, String startTime, String endTime, String orderAccount) {
        return cardboardEnterMapper.findByPurEnterAll(queryList,startTime,endTime,orderAccount);
    }

    @Override
    public List<CardboardEnter> dropSelectPurEnter(String q) {
        return cardboardEnterMapper.dropSelectPurEnter(q);
    }

    @Override
    public List<CardboardEnter> findByPurOO(String purchaseAccount, String orderAccount) {
        return cardboardEnterMapper.findByPurOO(purchaseAccount,orderAccount);
    }

    @Override
    public CardboardEnter getMaxEnterOrder(String time1) {
        return cardboardEnterMapper.getMaxEnterOrder(time1);
    }

    @Override
    public List<StorageLabel> getListByPurId(List<CardboardEnter> list) {
        return cardboardEnterMapper.getListByPurId(list);
    }
}
