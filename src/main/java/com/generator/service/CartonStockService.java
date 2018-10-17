package com.generator.service;


import com.generator.pojo.CartonStock;
import com.generator.pojo.Cartonout;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.ExcelBean;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

/**
 * 成品仓库接口
 */
public interface CartonStockService {
    //查询所有记录
     List<CartonStock> selectAll(int cur,int limit,String custome);
     //带条件查询
     List<CartonStock> selectAl(int cur,int limit,String orderAccount,String purchaseSpec,String fluteType,String cartonSize,String minNum,String maxNum);
    //topjui查询列表
    List<CartonStock>selectTopjui(int cur,int rows,String sort,String order, List<ComplexQuery> queryList);

    List<CartonStock>selectTop( List<ComplexQuery> queryList);

     List<CartonStock> select(String q);
     //根据订单id查询信息
    CartonStock selectById(String place);
    //添加记录
    int addCS(CartonStock cartonStock);
    //修改记录
    int updataCS(CartonStock cartonStock);

    //根据订单号修改该订单库存
    int updateById(String place,int storgeNum,int palletNumber);

    //删除记录
    int deleteCS(int id);

    List<CartonStock>findByCustom(String customName);

    CartonStock findById(String orderAccount);

    List<CartonStock> selectCs(String cust);

    /**
     * 导出excel
     * @param mmp
     * @param sheetName
     * @return
     * @throws InvocationTargetException
     * @throws ClassNotFoundException
     * @throws IntrospectionException
     * @throws ParseException
     * @throws IllegalAccessException
     */
    XSSFWorkbook export(Map<Integer,List<ExcelBean>> mmp, String sheetName) throws InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException, IllegalAccessException;
}
