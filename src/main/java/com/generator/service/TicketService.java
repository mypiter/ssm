package com.generator.service;


import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Ticket;

import java.util.List;

/**
 * 开出发票登记接口
 */
public interface TicketService {

    /**
     * 发票列表      加载出所有的发票数据 分页查询
     * @param cur
     * @param rows
     * @param sort
     * @param order
     * @param queryList
     * @param startTime
     * @param endTime
     * @return
     */
    List<Ticket> findByTicket(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime);

    /**
     * 发票列表      加载出所有的发票数据 查询全部
     * @param queryList
     * @param startTime
     * @param endTime
     * @return
     */
    List<Ticket> findByTicketAll(List<ComplexQuery> queryList, String startTime, String endTime);

    /**
     * 添加发票信息
     * @param ticket
     * @return
     */
    int addTi(Ticket ticket);

    /**
     * 批量假删除发票记录
     * @param list
     * @return
     */
    int updateFakes(List<Ticket> list);
}
