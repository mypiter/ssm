package com.generator.service;

import com.generator.pojo.TicketProduct;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 发票货物业务层
 */
public interface TicketProductService {
    /**
     *根据发票id 加载发票的货物详情      分页查询
     * @param cur
     * @param rows
     * @param sort
     * @param order
     * @param tick
     * @return
     */
    List<TicketProduct> findByTicketProduct(int cur, int rows, String sort, String order, int tick);

    /**
     * 根据发票id 加载发票的货物详情      查询全部
     * @param tick
     * @return
     */
    List<TicketProduct> findByTicketProductAll(int tick);

    int addTP(List<TicketProduct> list);

    /**
     * 批量假删除发票货物详情  根据发票id
     * @param listPro
     * @return
     */
    int updateFakes(List<TicketProduct> listPro);
}
