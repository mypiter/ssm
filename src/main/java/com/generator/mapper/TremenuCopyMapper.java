package com.generator.mapper;

import com.generator.pojo.TremenuCopy;

public interface TremenuCopyMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tremenu_copy
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tremenu_copy
     *
     * @mbggenerated
     */
    int insert(TremenuCopy record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tremenu_copy
     *
     * @mbggenerated
     */
    int insertSelective(TremenuCopy record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tremenu_copy
     *
     * @mbggenerated
     */
    TremenuCopy selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tremenu_copy
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(TremenuCopy record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tremenu_copy
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(TremenuCopy record);
}