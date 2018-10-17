package com.generator.mapper;

import com.generator.pojo.ComplexQuery;
import com.generator.pojo.ReceiptRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReceiptRecordMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table receipt_record
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer receiptRecordId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table receipt_record
     *
     * @mbggenerated
     */
    int insert(ReceiptRecord record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table receipt_record
     *
     * @mbggenerated
     */
    int insertSelective(ReceiptRecord record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table receipt_record
     *
     * @mbggenerated
     */
    ReceiptRecord selectByPrimaryKey(Integer receiptRecordId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table receipt_record
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(ReceiptRecord record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table receipt_record
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(ReceiptRecord record);

    List<ReceiptRecord> select(@Param("cur") int cur, @Param("rows") int rows, @Param("sort") String sort, @Param("order") String order, @Param("list") List<ComplexQuery> queryList, @Param("startTime") String startTime, @Param("endTime") String endTime);

    List<ReceiptRecord> selectAll(@Param("list") List<ComplexQuery> queryList,@Param("startTime") String startTime,@Param("endTime") String endTime);
}