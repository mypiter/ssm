package com.generator.mapper;

import com.generator.pojo.Admin;
import com.generator.pojo.ComplexQuery;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table admin
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer adminId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table admin
     *
     * @mbggenerated
     */
    int insert(Admin record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table admin
     *
     * @mbggenerated
     */
    int insertSelective(Admin record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table admin
     *
     * @mbggenerated
     */
    Admin selectByPrimaryKey(Integer adminId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table admin
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Admin record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table admin
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Admin record);

    Admin selectByAccount(@Param(value = "account") String account);

    List<Admin> selectAdmin(@Param("cur") int cur,@Param("rows") int rows,@Param("sort") String sort,@Param("order") String order,@Param("list") List<ComplexQuery> queryList);

    List<Admin> selectAdminAll(@Param("list") List<ComplexQuery> queryList);
}