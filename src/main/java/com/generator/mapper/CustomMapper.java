package com.generator.mapper;

import com.generator.pojo.CartonOutInfo;
import com.generator.pojo.CartonStock;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Custom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table custom
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer customId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table custom
     *
     * @mbggenerated
     */
    int insert(Custom record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table custom
     *
     * @mbggenerated
     */
    int insertSelective(Custom record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table custom
     *
     * @mbggenerated
     */
    Custom selectByPrimaryKey(Integer customId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table custom
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Custom record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table custom
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Custom record);

    /**
     * 客户下拉框查询所有的客户信息
     * @return
     */
    List<Custom> selects(@Param(value = "q") String q);

    List<Custom> selectAll(@Param("list") List<ComplexQuery> queryList);

    List<Custom> select(@Param("cur") int cur,@Param("rows")  int rows,@Param("sort")  String sort,@Param("oder")  String oder,@Param("list")  List<ComplexQuery> queryList);

    List<Custom> selectA(@Param("list")List<CartonStock> list);

    /**
     * 批量假删除
     * @param listCustom
     * @return
     */
    int updateByCusFakeS(List<Custom> listCustom);

    List<Custom> selectB(@Param("list")List<CartonOutInfo> list);

    List<Custom> selectBylist(List<CartonStock> list);
}