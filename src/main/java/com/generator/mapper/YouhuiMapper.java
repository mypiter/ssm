package com.generator.mapper;

import com.generator.pojo.Youhui;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface YouhuiMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table youhui
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table youhui
     *
     * @mbggenerated
     */
    int insert(Youhui record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table youhui
     *
     * @mbggenerated
     */
    int insertSelective(Youhui record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table youhui
     *
     * @mbggenerated
     */
    Youhui selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table youhui
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Youhui record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table youhui
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Youhui record);

    List<Youhui> selectById(@Param(value="id") int id,@Param(value="cur") int cur,@Param(value="rows") int rows);

    List<Youhui> findAll(int i);

    List<Youhui> findByC(@Param(value="sid")int sid, @Param(value="ceng")int ceng);
}