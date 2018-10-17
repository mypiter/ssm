package com.generator.service.impl;

import com.generator.common.ExcelUtil;
import com.generator.mapper.CartonStockMapper;
import com.generator.pojo.*;
import com.generator.service.CartonStockService;
import org.apache.ibatis.jdbc.RuntimeSqlException;
import org.apache.ibatis.session.SqlSessionException;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import javax.annotation.Resource;
import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class CartonStockServiceImpl implements CartonStockService {

    @Resource
    CartonStockMapper cartonStockMapper;

    @Override
    public List<CartonStock> selectAll(int cur,int limit,String custome) {
        List<CartonStock> list=new ArrayList<CartonStock>();
        list=cartonStockMapper.selectAll(cur,limit,custome);
        return list;
    }

    @Override
    public List<CartonStock> selectAl(int cur, int limit, String orderAccount, String purchaseSpec, String fluteType, String cartonSize, String minNum, String maxNum) {
        return cartonStockMapper.selectAl(cur,limit,orderAccount,purchaseSpec,fluteType,cartonSize,minNum,maxNum);
    }

    @Override
    public List<CartonStock> selectTopjui(int cur, int rows, String sort, String order, List<ComplexQuery> queryList) {
        return cartonStockMapper.selectTopjui(cur,rows,sort,order,queryList);
    }

    @Override
    public List<CartonStock> selectTop(List<ComplexQuery> queryList) {
        return cartonStockMapper.selectTop(queryList);
    }

    @Override
    public List<CartonStock> select(String q) {
        return cartonStockMapper.select(q);
    }

    @Override
    public CartonStock selectById(String place) {
        CartonStock cartonStock=new CartonStock();
        cartonStock=cartonStockMapper.selectById(place);
        return cartonStock;
    }

    @Override
    public int addCS(CartonStock cartonStock) {
        int num=cartonStockMapper.insertSelective(cartonStock);
        return num;
    }

    @Override
    public int updataCS(CartonStock cartonStock) {
        return 0;
    }

    @Override
    public int updateById(String place,int storgeNum,int palletNumber) {
        int num=cartonStockMapper.updataById(place,storgeNum,palletNumber);
        return num;
    }

    @Override
    public int deleteCS(int id) {
        return 0;
    }

    @Override
    public List<CartonStock> findByCustom(String customName) {
        return cartonStockMapper.findByCustom(customName);
    }

    @Override
    public CartonStock findById(String orderAccount) {
        return cartonStockMapper.findById(orderAccount);
    }

    @Override
    public List<CartonStock> selectCs(String cust) {
        return cartonStockMapper.selectCs(cust);
    }

    @Override
    public XSSFWorkbook export(Map<Integer, List<ExcelBean>> mmp, String sheetName) throws InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException, IllegalAccessException {
        List<CartonStock> list = cartonStockMapper.findByProList();
        for(int i=0;i<list.size();i++){
            CartonStock productionList = list.get(i);
            productionList.setMaterialScience(productionList.getMaterialScience()+"/"+productionList.getPitType());
//            if(productionList.getState()==1){
//
//            }else{
//
//            }
        }
        XSSFWorkbook xssfWorkbook = null;
        xssfWorkbook = ExcelUtil.creteExcelFile(CartonStock.class,list,mmp,sheetName);
        return xssfWorkbook;
    }

}
