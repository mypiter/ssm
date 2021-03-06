package com.generator.mapper;

import com.generator.pojo.CartonPurchase;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Place;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartonPurchaseMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carton_purchase
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer purchaseId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carton_purchase
     *
     * @mbggenerated
     */
    int insert(CartonPurchase record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carton_purchase
     *
     * @mbggenerated
     */
    int insertSelective(CartonPurchase record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carton_purchase
     *
     * @mbggenerated
     */
    CartonPurchase selectByPrimaryKey(Integer purchaseId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carton_purchase
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(CartonPurchase record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carton_purchase
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(CartonPurchase record);

    /**
     * 查询出可以纸板入库的采购单 purchaseAccount可为null
     * @param cur
     * @param limit
     * @param purchaseAccount
     * @param supplier
     * @param tys
     * @return
     */
    List<CartonPurchase> findByEnter(@Param(value = "cur") int cur, @Param(value = "limit") int limit, @Param(value = "purchaseAccount") String purchaseAccount, @Param(value = "supplier") int supplier,@Param(value = "tys") int tys);

    /**
     * 查询出所有的采购单可入库采购单  purchaseAccount可为null
     * @return
     * @param purchaseAccount
     * @param supplier
     * @param tys
     */
    List<CartonPurchase> findByEnterAll(@Param(value = "purchaseAccount") String purchaseAccount, @Param(value = "supplier") int supplier,@Param(value = "tys") int tys);

    /**
     * 下拉框采购单号查询
     * @param q
     * @return
     */
    List<CartonPurchase> dropSelectPurchase(@Param(value = "q") String q);

    /**
     * 修改采购单的 到料数量
     * @param orderAccount
     * @param orderId
     * @param num
     * @return
     */
    int updateByEndNum(@Param(value = "orderAccount") String orderAccount,@Param(value = "orderId") String orderId,@Param(value = "num") Integer num);

    /**
     * 批量修改采购单到料数量
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
    List<CartonPurchase> findByPurOrder(@Param("cur") int cur,@Param("rows") int rows,@Param("sort") String sort,@Param("order") String order,@Param("list") List<ComplexQuery> queryList,@Param("startTime") String startTime, @Param("endTime") String endTime);

    /**
     * 采购单统计报表查询所有数据
     * @param queryList
     * @param startTime
     * @param endTime
     * @return
     */
    List<CartonPurchase> findByPurOrderAll(@Param("list") List<ComplexQuery> queryList,@Param("startTime") String startTime, @Param("endTime") String endTime);

    /**
     * 根据采购单号查询所有采购单记录
     * @param purchaseAccount
     * @return
     */
    List<CartonPurchase> findByPurAccount(@Param("purchaseAccount") String purchaseAccount);

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
    List<CartonPurchase> findBySuppPurOrder(@Param("cur") int cur,@Param("limit")  int limit,@Param("supplier")  int supplier);

    /**
     * 接收发票登记，加载出该供应商所有的采购单记录   查询全部
     * @param supplier
     * @return
     */
    List<CartonPurchase> findBySuppPurOrderAll(@Param("supplier") int supplier);

    /**
     * 查询数据库中当天最大采购单号
     * @param time1
     * @return
     */
    CartonPurchase getMaxPurOrder(@Param("time1") String time1);

    /**
     * 根据采购记录id和状态，编辑该条采购记录的fake值
     * @param type
     * @param purchaseId
     * @return
     */
    int updateByPurid(@Param("type") int type,@Param("purchaseId") int purchaseId);

    /**
     * 下拉框供应商
     * @param q
     * @return
     */
    List<CartonPurchase> dropSupper(@Param("q") String q);

    /**
     * 根据采购单号和订单号查找采购单信息
     * @param purchaseAccount
     * @param orderAccount
     * @return
     */
    CartonPurchase findByPurOderAccount(@Param("purchaseAccount") String purchaseAccount,@Param("orderAccount") String orderAccount);
}