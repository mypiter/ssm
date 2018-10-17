package com.generator.mapper;

import com.generator.pojo.ReceivingAddress;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReceivingAddressMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table receiving_address
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table receiving_address
     *
     * @mbggenerated
     */
    int insert(ReceivingAddress record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table receiving_address
     *
     * @mbggenerated
     */
    int insertSelective(ReceivingAddress record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table receiving_address
     *
     * @mbggenerated
     */
    ReceivingAddress selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table receiving_address
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(ReceivingAddress record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table receiving_address
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(ReceivingAddress record);

    /**
     * 批量添加客户收货地址
     * @param list
     * @return
     */
    int addS(List<ReceivingAddress> list);

    /**
     * 根据客户id查询客户收货地址   分页查询
     * @param cur
     * @param rows
     * @param customId
     * @return
     */
    List<ReceivingAddress> findByCusId(@Param("cur") int cur,@Param("rows") int rows,@Param("customId") String customId);

    /**
     * 根据客户id查询客户收货地址   查询全部
     * @param customId
     * @return
     */
    List<ReceivingAddress> findByCusIdAll(@Param("customId") String customId);

    /**
     * 批量客户列表删除客户收货地址
     * @param list
     * @return
     */
    int deleteReceivingAdderss(List<ReceivingAddress> list);
}