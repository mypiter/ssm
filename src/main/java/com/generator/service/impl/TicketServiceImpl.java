package com.generator.service.impl;

import com.generator.mapper.TicketMapper;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Ticket;
import com.generator.service.TicketService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TicketServiceImpl implements TicketService {
    @Resource
    private TicketMapper ticketMapper;

    @Override
    public List<Ticket> findByTicket(int cur, int rows, String sort, String order, List<ComplexQuery> queryList, String startTime, String endTime) {
        return ticketMapper.findByTicket(cur,rows,sort,order,queryList,startTime,endTime);
    }

    @Override
    public List<Ticket> findByTicketAll(List<ComplexQuery> queryList, String startTime, String endTime) {
        return ticketMapper.findByTicketAll(queryList,startTime,endTime);
    }

    @Override
    public int addTi(Ticket ticket) {
        return ticketMapper.insertSelective(ticket);
    }

    @Override
    public int updateFakes(List<Ticket> list) {
        return ticketMapper.updateFakes(list);
    }
}
