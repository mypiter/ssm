package com.generator.service;

import com.generator.pojo.CartonPurchase;
import com.generator.pojo.ComplexQuery;

import java.util.List;

/**
 * 采购单业务
 */
public interface PurchaseService {
    /**
     * 添加采购单
     * @param cartonPurchase
     * @return
     */
    int addPurchase(CartonPurchase cartonPurchase);

    /**
     * 查询出可以纸板入库的采购单
     * @param cur
     * @param limit
     * @param purchaseAccount
     * @param supplier
     * @param tys
     * @return
     */
    List<CartonPurchase> findByEnter(int cur, int limit, String purchaseAccount, int supplier, int tys);

    /**
     * 可根据采购单号查询出所有的采购单可入库采购单
     * @return
     * @param purchaseAccount
     * @param supplier
     * @param tys
     */
    List<CartonPurchase> findByEnterAll(String purchaseAccount, int supplier, int tys);

    /**
     * 下拉框采购单号查询
     * @param q
     * @return
     */
    List<CartonPurchase> dropSelectPurchase(String q);

    /**
     * 修改采购单的 到料数量
     * @param orderAccount
     * @param orderId
     * @param num
     * @return
     */
    int updateByEndNum(String orderAccount, String orderId, Integer num);

    /**
     * 批量修改采购单的到料数量
     * @param lists
     * @return
     */
    int updateByEndNums(List<CartonPurchase> lists);

    /**
     * 在采购单中查询该订单
     * @param orderAccount
     * @return
     */
    List<CartonPurchase> findByOrderAccount(String orderAccount);

    /**
     * 采购单统计报表分页查询数据
     * @param cur
     * @param rows
     * @param sort
     * @param order
     * @param queryList
     * @param startTime
     * @param endTime
     * @return
     */
    List<CartonPurchase> findByPurOrder(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime);

    /**
     * 采购单统计报表查询所有数据
     * @param queryList
     * @param startTime
     * @param endTime
     * @return
     */
    List<CartonPurchase> findByPurOrderAll(List<ComplexQuery> queryList, String startTime, String endTime);

    /**
     * 通过id查找采购单记录
     * @param purchaseId
     * @return
     */
    CartonPurchase findByPurId(int purchaseId);

    /**
     * 更新采购单
     * @param cartonPurchase
     * @return
     */
    int updatePurOrder(CartonPurchase cartonPurchase);

    /**
     * 根据采购单号查询所有采购单记录
     * @param purchaseAccount
     * @return
     */
    List<CartonPurchase> findByPurAccount(String purchaseAccount);

    /**
     * 纸板采购单批量假删除
     * @param listPur
     * @return
     */
    int updateByfakeS(List<CartonPurchase> listPur);

    /**
     * 接收发票登记，加载出该供应商所有的采购单记录   分页查询
     * @param cur
     * @param limit
     * @param supplier
     * @return
     */
    List<CartonPurchase> findBySuppPurOrder(int cur, int limit, int supplier);

    /**
     * 接收发票登记，加载出该供应商所有的采购单记录   查询全部
     * @param supplier
     * @return
     */
    List<CartonPurchase> findBySuppPurOrderAll(int supplier);

    /**
     * 查询数据库中当天最大采购单号
     * @param time1
     * @return
     */
    CartonPurchase getMaxPurOrder(String time1);

    /**
     * 根据采购记录id和状态，编辑该条采购记录的fake值
     * @param type
     * @param purchaseId
     * @return
     */
    int updateByPurid(int type, int purchaseId);

    /**
     * 下拉框供应商
     * @param q
     * @return
     */
    List<CartonPurchase> dropSupper(String q);

    /**
     * 根据采购单号和订单号查找采购单信息
     * @param purchaseAccount
     * @param orderAccount
     * @return
     */
    CartonPurchase findByPurOderAccount(String purchaseAccount, String orderAccount);
}
