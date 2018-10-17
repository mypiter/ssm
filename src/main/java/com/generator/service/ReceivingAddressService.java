package com.generator.service;

import com.generator.pojo.ReceivingAddress;

import java.util.List;

/**
 * 客户收货地址   业务层
 */
public interface ReceivingAddressService {
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
    List<ReceivingAddress> findByCusId(int cur, int rows, String customId);

    /**
     * 根据客户id查询客户收货地址   查询全部
     * @param customId
     * @return
     */
    List<ReceivingAddress> findByCusIdAll(String customId);

    /**
     * 客户列表新增客户收货地址
     * @param receivingAddress
     * @return
     */
    int addReceivingAddr(ReceivingAddress receivingAddress);

    /**
     * 客户列表编辑客户收货地址
     * @param receivingAddress
     * @return
     */
    int updateReceivingAdderss(ReceivingAddress receivingAddress);

    /**
     * 批量客户列表删除客户收货地址
     * @param list
     * @return
     */
    int deleteReceivingAdderss(List<ReceivingAddress> list);
}
