package com.generator.service.impl;

import com.generator.mapper.TicketProductMapper;
import com.generator.pojo.TicketProduct;
import com.generator.service.TicketProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TicketProductServiceImpl implements TicketProductService {
    @Resource
    private TicketProductMapper ticketProductMapper;

    @Override
    public List<TicketProduct> findByTicketProduct(int cur, int rows, String sort, String order, int tick) {
        return ticketProductMapper.findByTicketProduct(cur,rows,sort,order,tick);
    }

    @Override
    public List<TicketProduct> findByTicketProductAll(int tick) {
        return ticketProductMapper.findByTicketProductAll(tick);
    }

    @Override
    public int addTP(List<TicketProduct> list) {
        return ticketProductMapper.addTP(list);
    }

    @Override
    public int updateFakes(List<TicketProduct> listPro) {
        return ticketProductMapper.updateFakes(listPro);
    }

}
