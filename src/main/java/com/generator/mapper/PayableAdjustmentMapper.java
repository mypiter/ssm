package com.generator.mapper;

import com.generator.pojo.PayableAdjustment;

public interface PayableAdjustmentMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table payable_adjustment
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer payableAdjustmentId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table payable_adjustment
     *
     * @mbggenerated
     */
    int insert(PayableAdjustment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table payable_adjustment
     *
     * @mbggenerated
     */
    int insertSelective(PayableAdjustment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table payable_adjustment
     *
     * @mbggenerated
     */
    PayableAdjustment selectByPrimaryKey(Integer payableAdjustmentId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table payable_adjustment
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(PayableAdjustment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table payable_adjustment
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(PayableAdjustment record);
}