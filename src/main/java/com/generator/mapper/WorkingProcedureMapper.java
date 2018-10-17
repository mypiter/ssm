package com.generator.mapper;

import com.generator.pojo.WorkingProcedure;

import java.util.List;

public interface WorkingProcedureMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table working_procedure
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table working_procedure
     *
     * @mbggenerated
     */
    int insert(WorkingProcedure record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table working_procedure
     *
     * @mbggenerated
     */
    int insertSelective(WorkingProcedure record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table working_procedure
     *
     * @mbggenerated
     */
    WorkingProcedure selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table working_procedure
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(WorkingProcedure record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table working_procedure
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(WorkingProcedure record);

    List<WorkingProcedure> select();

    List<WorkingProcedure> selectByco(String[] str);
}