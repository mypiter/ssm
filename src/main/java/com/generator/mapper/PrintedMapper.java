package com.generator.mapper;

import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Printed;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PrintedMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table printed
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer printedId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table printed
     *
     * @mbggenerated
     */
    int insert(Printed record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table printed
     *
     * @mbggenerated
     */
    int insertSelective(Printed record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table printed
     *
     * @mbggenerated
     */
    Printed selectByPrimaryKey(Integer printedId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table printed
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Printed record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table printed
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Printed record);

    /**
     * 印版下拉框查询所有的印版信息
     * @return
     */
    List<Printed> dropSelect(@Param(value = "q") String q);

    List<Printed> select(@Param("cur") int cur,@Param("rows") int rows,@Param("sort") String sort,@Param("oder") String oder,@Param("list") List<ComplexQuery> queryList);

    List<Printed> selectAll(@Param("list") List<ComplexQuery> queryList);
}