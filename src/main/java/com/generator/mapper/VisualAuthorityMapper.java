package com.generator.mapper;

import com.generator.pojo.VisualAuthority;

public interface VisualAuthorityMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table visual_authority
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table visual_authority
     *
     * @mbggenerated
     */
    int insert(VisualAuthority record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table visual_authority
     *
     * @mbggenerated
     */
    int insertSelective(VisualAuthority record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table visual_authority
     *
     * @mbggenerated
     */
    VisualAuthority selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table visual_authority
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(VisualAuthority record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table visual_authority
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(VisualAuthority record);
}