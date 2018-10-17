package com.generator.service;

import com.generator.pojo.ComplexQuery;
import com.generator.pojo.ExcelBean;
import com.generator.pojo.Place;
import com.generator.pojo.ProductionList;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

/**
 * 订单业务接口
 */
public interface PlaceService {
    /**
     * 新增订单
     * @param place
     * @return
     */
    int addPlace(Place place);

    /**
     * 查询出所有所有待采购订单的集合
     * @param page
     * @param limit
     * @return
     */
    List<Place> findByPurchase(int page,int limit);

    /**
     * 查询所有满足条件的订单
     * @return
     */
    List<Place> findAll();

    /**
     * 修改订单的已采购总数
     * @param orderAccount
     * @param num
     */
    void updatePurNum(String orderAccount,int num);
    /**
     * 根据订单号查询订单
     */
    Place findById(String place_oder);

    /**
     * 订单下拉框查询
     * @param q
     * @return
     */
    List<Place> dropSelectPlace(String q);

    /**
     * 加载订单报表list   分页
     *
     * @param cur
     * @param rows
     * @param sort
     * @param order
     * @param queryList
     * @param startTime
     * @param startTime
     * @return
     */
    List<Place> loadPlaceList(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime);

    /**
     * 加载订单报表list   全部复合条件的记录
     * @param queryList
     * @param startTime
     * @param endTime
     * @return
     */
    List<Place> loadPlaceListAll(List<ComplexQuery> queryList, String startTime, String endTime);

    /**
     * 通过id获取订单记录
     * @param placeId
     * @return
     */
    Place getPlace(int placeId);

    /**
     * 编辑订单
     * @param place
     * @return
     */
    int updatePlace(Place place);

    /**
     * 批量删除订单
     * @param list
     * @return
     */
    int deletePlace(List<Place> list);

    /**
     * 下拉菜单查询
     * @param q
     * @return
     */
    List<Place> selects(String q);

    List<Place> getListByPid(String customName);

    List<Place> getList(String q, String customName);
    /**
     *生产单列表查询  分页查询
     * @param cur
     * @param rows
     * @return
     */
    List<ProductionList> findByProListPage(int cur, int rows);

    /**
     * 生产单列表查询  查询全部
     * @return
     */
    List<ProductionList> findByProList();

    /**
     * 根据客户名查询其所有的订单
     * @param customN
     * @return
     */
    List<Place> findByCustom(String customN);

    List<Place> getListByCustomName(String customName);

    Place getPlaceByOrderAccount(String orderAccount);

    List<Place> getListByOrderAccount(String customName, String cartonName);


    XSSFWorkbook export(Map<Integer,List<ExcelBean>> mmp, String sheetName) throws InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException, IllegalAccessException;

    /**
     * 获取数据库中当天的最大的订单号
     * @param time
     * @return
     */
    Place findByMaxAccount(String time);

    /**
     * 根据楞型id查找出含有list
     * @param i
     * @return
     */
    List<Place> findByPitId(int i);

    /**
     * 根据id获取批量订单数据
     * @param list
     * @return
     */
    List<Place> getListById(List<Place> list);
    //根据id修改id
    int updateById(int id);

    List<Place> findByList();

    List<Place> findByProListP(int cur, int rows);
}
