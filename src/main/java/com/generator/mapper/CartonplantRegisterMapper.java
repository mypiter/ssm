package com.generator.mapper;

import com.generator.pojo.CartonplantRegister;

public interface CartonplantRegisterMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cartonplant_model2
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer cartonId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cartonplant_model2
     *
     * @mbggenerated
     */
    int insert(CartonplantRegister record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cartonplant_model2
     *
     * @mbggenerated
     */
    int insertSelective(CartonplantRegister record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cartonplant_model2
     *
     * @mbggenerated
     */
    CartonplantRegister selectByPrimaryKey(Integer cartonId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cartonplant_model2
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(CartonplantRegister record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cartonplant_model2
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(CartonplantRegister record);
}