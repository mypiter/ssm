package com.generator.service;

import com.generator.pojo.CartonFormula;
import com.generator.pojo.CartonPitRelation;

import java.util.List;

/**
 * 箱型楞型关系业务层
 */
public interface CartonPitRelationService {
    /**
     * 批量添加箱型楞型关系
     * @param list
     * @return
     */
    int addRelatinS(List<CartonPitRelation> list);

    /**
     * 通过箱型id和楞型id查询出系数
     * @param integer
     * @param integer1
     * @return
     */
    CartonPitRelation findRelation(Integer integer, Integer integer1);

    /**
     * 通过箱型id加载出该箱型的所有楞型系数  分页查询
     * @param cur
     * @param rows
     * @param integer
     * @return
     */
    List<CartonPitRelation> findByCartonId(int cur, int rows, Integer integer);

    /**
     * 通过箱型id加载出该箱型的所有楞型系数  查询全部
     * @param integer
     * @return
     */
    List<CartonPitRelation> findByCartonIdAll(Integer integer);

    /**
     * 批量删除箱型楞型关系表
     * @param list
     * @return
     */
    int deleteBatchCarPit(List<CartonFormula> list);

    /**
     * 修改箱型楞型系数
     * @param cartonPitRelation
     * @return
     */
    int updateCartonPit(CartonPitRelation cartonPitRelation);

    /**
     * 删除箱型楞型关系镖中的数据
     * @param i
     * @return
     */
    int deleteByPitId(int i);
}
