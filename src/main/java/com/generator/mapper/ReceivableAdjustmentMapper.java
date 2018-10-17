package com.generator.mapper;

import com.generator.pojo.ComplexQuery;
import com.generator.pojo.ReceivableAdjustment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReceivableAdjustmentMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table receivable_adjustment
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer receivableAdjustmentId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table receivable_adjustment
     *
     * @mbggenerated
     */
    int insert(ReceivableAdjustment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table receivable_adjustment
     *
     * @mbggenerated
     */
    int insertSelective(ReceivableAdjustment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table receivable_adjustment
     *
     * @mbggenerated
     */
    ReceivableAdjustment selectByPrimaryKey(Integer receivableAdjustmentId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table receivable_adjustment
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(ReceivableAdjustment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table receivable_adjustment
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(ReceivableAdjustment record);

    List<ReceivableAdjustment> loadReceivableList(@Param("cur") int cur,@Param("rows") int rows, @Param("sort") String sort,@Param("order") String order,@Param("list") List<ComplexQuery> queryList);

    List<ReceivableAdjustment> loadReceivableListAll(@Param("list") List<ComplexQuery> queryList);
}