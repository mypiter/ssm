package com.generator.service.impl;

import com.generator.mapper.CartonPurchaseMapper;
import com.generator.pojo.CartonPurchase;
import com.generator.pojo.ComplexQuery;
import com.generator.service.PurchaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PurchaseServiceImpl implements PurchaseService {
    @Resource
    private CartonPurchaseMapper cartonPurchaseMapper;
    @Override
    public int addPurchase(CartonPurchase cartonPurchase) {
        return cartonPurchaseMapper.insertSelective(cartonPurchase);
    }

    @Override
    public List<CartonPurchase> findByEnter(int cur, int limit, String purchaseAccount, int supplier, int tys) {
        return cartonPurchaseMapper.findByEnter(cur,limit,purchaseAccount,supplier,tys);
    }

    @Override
    public List<CartonPurchase> findByEnterAll(String purchaseAccount, int supplier, int tys) {
        return cartonPurchaseMapper.findByEnterAll(purchaseAccount,supplier,tys);
    }

    @Override
    public List<CartonPurchase> dropSelectPurchase(String q) {
        return cartonPurchaseMapper.dropSelectPurchase(q);
    }

    @Override
    public int updateByEndNum(String orderAccount, String orderId, Integer num) {
        return cartonPurchaseMapper.updateByEndNum(orderAccount,orderId,num);
    }

    @Override
    public int updateByEndNums(List<CartonPurchase> lists) {
        return cartonPurchaseMapper.updateByEndNums(lists);
    }

    @Override
    public List<CartonPurchase> findByOrderAccount(String orderAccount) {
        return cartonPurchaseMapper.findByOrderAccount(orderAccount);
    }

    @Override
    public List<CartonPurchase> findByPurOrder(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime) {
        return cartonPurchaseMapper.findByPurOrder(cur,rows,sort,order,queryList,startTime,endTime);
    }

    @Override
    public List<CartonPurchase> findByPurOrderAll(List<ComplexQuery> queryList, String startTime, String endTime) {
        return cartonPurchaseMapper.findByPurOrderAll(queryList,startTime,endTime);
    }

    @Override
    public CartonPurchase findByPurId(int purchaseId) {
        return cartonPurchaseMapper.selectByPrimaryKey(purchaseId);
    }

    @Override
    public int updatePurOrder(CartonPurchase cartonPurchase) {
        return cartonPurchaseMapper.updateByPrimaryKeySelective(cartonPurchase);
    }

    @Override
    public List<CartonPurchase> findByPurAccount(String purchaseAccount) {
        return cartonPurchaseMapper.findByPurAccount(purchaseAccount);
    }

    @Override
    public int updateByfakeS(List<CartonPurchase> listPur) {
        return cartonPurchaseMapper.updateByfakeS(listPur);
    }

    @Override
    public List<CartonPurchase> findBySuppPurOrder(int cur, int limit, int supplier) {
        return cartonPurchaseMapper.findBySuppPurOrder(cur,limit,supplier);
    }

    @Override
    public List<CartonPurchase> findBySuppPurOrderAll(int supplier) {
        return cartonPurchaseMapper.findBySuppPurOrderAll(supplier);
    }

    @Override
    public CartonPurchase getMaxPurOrder(String time1) {
        return cartonPurchaseMapper.getMaxPurOrder(time1);
    }

    @Override
    public int updateByPurid(int type, int purchaseId) {
        return cartonPurchaseMapper.updateByPurid(type,purchaseId);
    }

    @Override
    public List<CartonPurchase> dropSupper(String q) {
        return cartonPurchaseMapper.dropSupper(q);
    }

    @Override
    public CartonPurchase findByPurOderAccount(String purchaseAccount, String orderAccount) {
        return cartonPurchaseMapper.findByPurOderAccount(purchaseAccount,orderAccount);
    }
}
