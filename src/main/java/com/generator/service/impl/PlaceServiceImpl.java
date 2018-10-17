package com.generator.service.impl;

import com.generator.common.ExcelUtil;
import com.generator.mapper.PlaceMapper;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.ExcelBean;
import com.generator.pojo.Place;
import com.generator.pojo.ProductionList;
import com.generator.service.PlaceService;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 订单业务实现层
 */
@Service
public class PlaceServiceImpl implements PlaceService {
    @Resource
    private PlaceMapper placeMapper;

    @Override
    public List<Place> findByPurchase(int page,int limit) {
        return placeMapper.findByPurchase(page,limit);
    }

    @Override
    public int addPlace(Place place) {
        return placeMapper.insert(place);
    }

    @Override
    public List<Place> findAll() {
        return placeMapper.findAll();
    }

    @Override
    public void updatePurNum(String orderAccount, int num) {
        placeMapper.updatePurNum(orderAccount,num);
    }
    @Override
    public Place findById(String place_oder) {
        Place place=new Place();
        place=placeMapper.selectById(place_oder);
        return place;
    }

    @Override
    public List<Place> dropSelectPlace(String q) {
        return placeMapper.dropSelectPlace(q);
    }

    @Override
    public List<Place> loadPlaceList(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime) {
        return placeMapper.loadPlaceList(cur,rows,sort,order,queryList,startTime,endTime);
    }

    @Override
    public List<Place> loadPlaceListAll(List<ComplexQuery> queryList, String startTime, String endTime) {
        return placeMapper.loadPlaceListAll(queryList,startTime,endTime);
    }

    @Override
    public Place getPlace(int placeId) {
        return placeMapper.selectByPrimaryKey(placeId);
    }

    @Override
    public int updatePlace(Place place) {
        return placeMapper.updateByPrimaryKeySelective(place);
    }

    @Override
    public int deletePlace(List<Place> list) {
        return placeMapper.deletePlace(list);
    }

    @Override
    public List<Place> selects(String q) {
        return placeMapper.selects(q);
    }

    @Override
    public List<Place> getListByPid(String customName) {
        List<Place>list=new ArrayList<Place>();
        list=placeMapper.getListByPid(customName);
        return list;
    }

    @Override
    public List<Place> getList(String q, String customName) {
        List<Place>list=new ArrayList<Place>();
        list=placeMapper.getList(q,customName);
        return list;
    }

    @Override
    public List<ProductionList> findByProListPage(int cur, int rows) {
        return placeMapper.findByProListPage(cur,rows);
    }

    @Override
    public List<ProductionList> findByProList() {
        return placeMapper.findByProList();
    }

    @Override
    public List<Place> findByCustom(String customN) {
        return placeMapper.findByCustom(customN);
    }

    @Override
    public List<Place> getListByCustomName(String customName) {
        return placeMapper.getListByCustomName(customName);
    }

    @Override
    public Place getPlaceByOrderAccount(String orderAccount) {
        return placeMapper.getPlaceByOrderAccount(orderAccount);
    }

    @Override
    public List<Place> getListByOrderAccount(String customName, String cartonName) {
        return placeMapper.getListByOrderAccount(customName, cartonName);
    }

    @Override
    public XSSFWorkbook export(Map<Integer, List<ExcelBean>> mmp, String sheetName) throws InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException, IllegalAccessException {
        List<ProductionList> list = placeMapper.findByProList();
        for(int i=0;i<list.size();i++){
            ProductionList productionList = list.get(i);
            productionList.setMaterialScience(productionList.getMaterialScience()+"/"+productionList.getPitType());
//            if(productionList.getState()==1){
//
//            }else{
//
//            }
        }
        XSSFWorkbook xssfWorkbook = null;
        xssfWorkbook = ExcelUtil.creteExcelFile(ProductionList.class,list,mmp,sheetName);
        return xssfWorkbook;
    }

    @Override
    public Place findByMaxAccount(String time) {
        return placeMapper.findByMaxAccount(time);
    }

    @Override
    public List<Place> findByPitId(int i) {
        return placeMapper.findByPitId(i);
    }

    @Override
    public List<Place> getListById(List<Place> list) {
        return placeMapper.getListById(list);
    }

    @Override
    public int updateById(int id) {
        return placeMapper.updateById(id);
    }

    /**
     * 排单列表
     * @return
     */
    @Override
    public List<Place> findByList() {

        return placeMapper.findByList();
    }

    @Override
    public List<Place> findByProListP(int cur, int rows) {

        return placeMapper.findByProListP(cur,rows);
    }
}
