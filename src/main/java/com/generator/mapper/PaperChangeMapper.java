package com.generator.mapper;

import com.generator.pojo.PaperChange;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PaperChangeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table paper_change
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer paperChangeId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table paper_change
     *
     * @mbggenerated
     */
    int insert(PaperChange record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table paper_change
     *
     * @mbggenerated
     */
    int insertSelective(PaperChange record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table paper_change
     *
     * @mbggenerated
     */
    PaperChange selectByPrimaryKey(Integer paperChangeId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table paper_change
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(PaperChange record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table paper_change
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(PaperChange record);

    List<PaperChange> selectById(@Param(value = "id")int id,@Param(value = "cur")int cur,@Param(value = "rows")int rows);

    List<PaperChange> selectBy(@Param(value = "yz")String yz, @Param(value = "th") String th);

    List<PaperChange> findAll(int id);
}