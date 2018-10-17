package com.generator.mapper;

import com.generator.pojo.CartonFormula;
import com.generator.pojo.ComplexQuery;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartonFormulaMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carton_formula
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carton_formula
     *
     * @mbggenerated
     */
    int insert(CartonFormula record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carton_formula
     *
     * @mbggenerated
     */
    int insertSelective(CartonFormula record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carton_formula
     *
     * @mbggenerated
     */
    CartonFormula selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carton_formula
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(CartonFormula record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carton_formula
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(CartonFormula record);

    /**
     * 下拉框箱型查询
     * @param q
     * @return
     */
    List<CartonFormula> dropSelectCarton(@Param("q") String q);

    /**
     * 通过箱型id查询压线公式
     * @param integer
     * @return
     */
    CartonFormula findFormula(@Param("integer") Integer integer);

    /**
     * 箱型列表加载所有的箱型公式        分页查询
     * @param cur
     * @param rows
     * @param sort
     * @param order
     * @param queryList
     * @return
     */
    List<CartonFormula> findCartonFor(@Param("cur") int cur, @Param("rows")  int rows, @Param("sort")  String sort, @Param("order")  String order, @Param("list")  List<ComplexQuery> queryList);

    /**
     * 查询全部
     * @param queryList
     * @return
     */
    List<CartonFormula> findCartonForAll(List<ComplexQuery> queryList);

    /**
     * 批量删除箱型公式
     * @param list
     * @return
     */
    int deleteBatch(List<CartonFormula> list);
}