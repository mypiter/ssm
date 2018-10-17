package com.generator.service;

import com.generator.pojo.CartonFormula;
import com.generator.pojo.ComplexQuery;

import java.util.List;

/**
 * 纸箱箱型公式业务层
 */
public interface CartonFormulaService {
    /**
     * 新增箱型公式记录
     * @param cartonFormula
     * @return
     */
    int addCartonFormula(CartonFormula cartonFormula);

    /**
     * 下拉框箱型查询
     * @param q
     * @return
     */
    List<CartonFormula> dropSelectCarton(String q);

    /**
     * 通过箱型id查询压线公式
     * @param integer
     * @return
     */
    CartonFormula findFormula(Integer integer);

    /**
     * 箱型列表加载所有的箱型公式        分页查询
     * @param cur
     * @param rows
     * @param sort
     * @param order
     * @param queryList
     * @return
     */
    List<CartonFormula> findCartonFor(int cur, int rows, String sort, String order, List<ComplexQuery> queryList);

    /**
     * 查询全部
     * @param queryList
     * @return
     */
    List<CartonFormula> findCartonForAll(List<ComplexQuery> queryList);

    /**
     * 修改箱型公式
     * @param cartonFormula
     * @return
     */
    int updateCartonFormula(CartonFormula cartonFormula);

    /**
     * 批量删除箱型公式
     * @param list
     * @return
     */
    int deleteBatch(List<CartonFormula> list);
}
