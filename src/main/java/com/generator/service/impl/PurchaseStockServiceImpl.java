package com.generator.service.impl;

import com.generator.mapper.PurchaseStockMapper;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Place;
import com.generator.pojo.PurchaseStock;
import com.generator.service.PurchaseStockService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PurchaseStockServiceImpl implements PurchaseStockService {
    @Resource
    private PurchaseStockMapper purchaseStockMapper;

    @Override
    public int addPurStockS(List<PurchaseStock> purStocks) {
        return purchaseStockMapper.addPurStockS(purStocks);
    }

    @Override
    public List<PurchaseStock> findByPurStockAll() {
        return purchaseStockMapper.findByPurStockAll();
    }

    @Override
    public List<PurchaseStock> findByPurStockS(int cur, int limit) {
        return purchaseStockMapper.findByPurStockS(cur,limit);
    }

    @Override
    public int updateByOutNumS(List<PurchaseStock> lists) {
        return purchaseStockMapper.updateByOutNumS(lists);
    }

    @Override
    public List<PurchaseStock> findNoByPurStock(int cur, int limit) {
        return purchaseStockMapper.findNoByPurStock(cur,limit);
    }

    @Override
    public List<PurchaseStock> findNoByPurStockAll() {
        return purchaseStockMapper.findNoByPurStockAll();
    }

    @Override
    public int updateByEditS(List<PurchaseStock> lists) {
        return purchaseStockMapper.updateByEditS(lists);
    }

    @Override
    public List<PurchaseStock> findByPurStockSloan(int cur, int limit, String orderAccount, String purchaseSpec, String fluteType, String cartonSize, String minNum, String maxNum) {
        return purchaseStockMapper.findByPurStockSloan(cur,limit,orderAccount,purchaseSpec,fluteType,cartonSize,minNum,maxNum);
    }

    @Override
    public List<PurchaseStock> findByPurStockAllloan(String orderAccount, String purchaseSpec, String fluteType, String cartonSize, String minNum, String maxNum) {
        return purchaseStockMapper.findByPurStockAllloan(orderAccount,purchaseSpec,fluteType,cartonSize,minNum,maxNum);
    }

    @Override
    public int updateByN(List<PurchaseStock> lists) {
        return purchaseStockMapper.updateByN(lists);
    }

    @Override
    public List<PurchaseStock> findByCarStock(int cur, int rows, String sort, String order, List<ComplexQuery> queryList) {
        return purchaseStockMapper.findByCarStock(cur,rows,sort,order,queryList);
    }

    @Override
    public List<PurchaseStock> findByCarStockAll(List<ComplexQuery> queryList) {
        return purchaseStockMapper.findByCarStockAll(queryList);
    }

    @Override
    public int updateByPurFake(List<PurchaseStock> list) {
        return purchaseStockMapper.updateByPurFake(list);
    }

    @Override
    public List<PurchaseStock> dropSelectPlace(String q) {
        return purchaseStockMapper.dropSelectPlace(q);
    }
}
