package com.generator.service;

import com.generator.pojo.CartonOutInfo;
import com.generator.pojo.CartonStock;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Custom;

import java.util.List;

/**
 * 客户业务层
 */
public interface CustomService {
    /**
     * 添加客户
     * @param custom
     * @return
     */
    int addCustom(Custom custom);

    /**
     * 客户下拉框查询所有的客户信息
     * @return
     */
    List<Custom> selects(String q);
    /**
     * 客户下拉框批量查询所有的客户信息
     * @return
     */
    List<Custom> selectBylist(List<CartonStock> list);

    /**
     * 根据id查询客户信息
     * @param customId
     * @return
     */
    Custom selectById(int customId);

    List<Custom> selectAll(String q);

    int updateCustom(Custom custom);

    int deleteCustom(int i);

    List<Custom> selectAlls(List<ComplexQuery> queryList);
    //根据条件查询客户信息
    List<Custom> selects(List<CartonStock>list);

    //根据条件查询客户信息
    List<Custom> selectB(List<CartonOutInfo>list);

    List<Custom> select(int cur, int rows, String sort, String oder, List<ComplexQuery> queryList);

    List<Custom> getListByPid();

    /**
     * 批量假删除
     * @param listCustom
     * @return
     */
    int updateByCusFakeS(List<Custom> listCustom);
}
