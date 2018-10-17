package com.generator.controller;

import com.generator.pojo.TicketProduct;
import com.generator.pojo.pageBaen;
import com.generator.service.TicketProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 发票货物控制层
 */
@Controller
@RequestMapping("/TicketProduct")
public class TicketProductController {
    @Resource
    private TicketProductService ticketProductService;

    /**
     *加载发票的货物详情
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @param ticketId
     * @return
     */
    @RequestMapping("/findByTicketProduct/")
    @ResponseBody
    public pageBaen findByTicketProduct(int page,int rows,String sort,String order,String ticketId){
        pageBaen pageBaen = new pageBaen();
        int cur = (page-1)*rows;
        List<TicketProduct> list = new ArrayList<TicketProduct>();
        List<TicketProduct> listAll = new ArrayList<TicketProduct>();
        if(ticketId!=null){
            int tick = Integer.valueOf(ticketId);
            list = ticketProductService.findByTicketProduct(cur,rows,sort,order,tick);
            listAll = ticketProductService.findByTicketProductAll(tick);
        }
        pageBaen.setTotal(listAll.size());
        pageBaen.setRows(list);
        int total=listAll.size();
        int totalPage=total%rows==0?(total/rows):(total/rows)+1;//总页数
        pageBaen.setTotalPage(totalPage);
        pageBaen.setCurrentPage(page);
        pageBaen.setNumPerPage(rows);
        pageBaen.setNextPage(totalPage-page==0?page:page+1);
        pageBaen.setPreviousPage(page-0==1?page:page-1);
        pageBaen.setHasPreviousPage(true);
        pageBaen.setHasNextPage(true);
        pageBaen.setFirstPage(true);
        pageBaen.setLastPage(true);
        return pageBaen;
    }

}
