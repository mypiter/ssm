package com.generator.service;

import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Place;
import com.generator.pojo.PurchaseStock;

import java.util.List;

/**
 * 纸板库存业务层
 */
public interface PurchaseStockService {
    /**
     * 批量添加纸板库存记录
     * @param purStocks
     * @return
     */
    int addPurStockS(List<PurchaseStock> purStocks);

    /**
     * 查询出所有可出库的库存记录
     * @return
     */
    List<PurchaseStock> findByPurStockAll();

    /**
     * 查询出所有可出库的库存记录        分页
     * @param cur
     * @param limit
     * @return
     */
    List<PurchaseStock> findByPurStockS(int cur, int limit);

    /**
     * 批量修改库存记录中的出库数量
     * @param lists
     * @return
     */
    int updateByOutNumS(List<PurchaseStock> lists);

    /**
     * 无条件查询所有纸板库存记录    分页
     * @param cur
     * @param limit
     * @return
     */
    List<PurchaseStock> findNoByPurStock(int cur, int limit);

    /**
     * 无条件查询所有纸板库存记录
     * @return
     */
    List<PurchaseStock> findNoByPurStockAll();

    /**
     * 批量调整库存记录
     * @param lists
     * @return
     */
    int updateByEditS(List<PurchaseStock> lists);

    /**
     * 查询出所有可借调的库存记录列表  分页
     * 并且带筛选功能
     * @param cur
     * @param limit
     * @param orderAccount
     * @param purchaseSpec
     * @param fluteType
     * @param cartonSize
     * @param minNum
     * @param maxNum
     * @return
     */
    List<PurchaseStock> findByPurStockSloan(int cur, int limit, String orderAccount, String purchaseSpec, String fluteType, String cartonSize, String minNum, String maxNum);

    /**
     * 查询出所有可借调的库存记录列表  总记录
     * 并且带筛选功能
     * @param orderAccount
     * @param purchaseSpec
     * @param fluteType
     * @param cartonSize
     * @param minNum
     * @param maxNum
     * @return
     */
    List<PurchaseStock> findByPurStockAllloan(String orderAccount, String purchaseSpec, String fluteType, String cartonSize, String minNum, String maxNum);

    /**
     * 批量修改订单纸板库存的借调数
     * @param lists
     * @return
     */
    int updateByN(List<PurchaseStock> lists);

    /**
     * 纸板库存报表 加载出所有的库存记录    分页查询
     * @param cur
     * @param rows
     * @param sort
     * @param order
     * @param queryList
     * @return
     */
    List<PurchaseStock> findByCarStock(int cur, int rows, String sort, String order, List<ComplexQuery> queryList);

    /**
     * 纸板库存报表 加载出所有的库存记录    查询全部
     * @param queryList
     * @return
     */
    List<PurchaseStock> findByCarStockAll(List<ComplexQuery> queryList);

    /**
     * 库存记录批量假删除
     * @param list
     * @return
     */
    int updateByPurFake(List<PurchaseStock> list);

    /**
     * 纸板库存中的订单 下拉框查询
     * @param q
     * @return
     */
    List<PurchaseStock> dropSelectPlace(String q);
}
