package com.generator.controller;


import com.generator.common.ResponseUtil;
import com.generator.pojo.*;
import com.generator.service.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import static com.generator.common.SystemException.unAbs;

/**
 *发票登记控制层
 */
@RequestMapping("/Ticket")
@Controller
public class TicketController {
      @Resource
      private CartonOutInfoService cartonOutInfoService;
      @Resource
      private CartonoutService cartonoutService;
      @Resource
      private TicketService ticketService;
      @Resource
      private TicketProductService ticketProductService;
      @Resource
      private PurchaseService purchaseService;

      @RequestMapping("/findList/")
      @ResponseBody
      public pageBaen findList(String customName) {
            pageBaen pages = new pageBaen();
            //根据客户查询该客户已签收的配送单
            List<CartonOutInfo> list = new ArrayList<CartonOutInfo>();
            list = cartonOutInfoService.getListByCus(customName);
            //根据配送单号查询该配送单所有订单
            List<Cartonout> lists = new ArrayList<Cartonout>();
            lists = cartonoutService.selectByCus(list);
            pages.setCode(0);
            pages.setCount(lists.size());
            pages.setData(lists);
            pages.setMsg("");
            return pages;
      }

      /**
       * 发票列表      加载出所有的发票数据
       *
       * @param page
       * @param rows
       * @param sort
       * @param order
       * @param advanceFilter
       * @param startTime
       * @param endTime
       * @return
       */
      @RequestMapping("/findByTicket/")
      @ResponseBody
      public pageBaen findByTicket(int page, int rows, String sort, String order, String advanceFilter, String startTime, String endTime) {
            pageBaen pageBaen = new pageBaen();
            int cur = (page - 1) * rows;
            List<ComplexQuery> queryList = new ArrayList<ComplexQuery>();
            if (advanceFilter != null && advanceFilter != "[]") {
                  JSONArray jsonArray = JSONArray.fromObject(advanceFilter);
                  Iterator<Object> it = jsonArray.iterator();
                  while (it.hasNext()) {
                        JSONObject obj = (JSONObject) it.next();
                        ComplexQuery complexQuery = new ComplexQuery();
                        complexQuery.setJoin((String) obj.get("join"));
                        complexQuery.setLb((String) obj.get("lb"));
                        complexQuery.setField((String) obj.get("field"));
                        complexQuery.setOp((String) obj.get("op"));
                        complexQuery.setValue((String) obj.get("value"));
                        complexQuery.setRb((String) obj.get("rb"));
                        queryList.add(complexQuery);
                  }
            }
            List<Ticket> list = ticketService.findByTicket(cur, rows, sort, order, queryList, startTime, endTime);
            List<Ticket> listAll = ticketService.findByTicketAll(queryList, startTime, endTime);
            pageBaen.setTotal(listAll.size());
            pageBaen.setRows(list);
            int total = listAll.size();
            int totalPage = total % rows == 0 ? (total / rows) : (total / rows) + 1;//总页数
            pageBaen.setTotalPage(totalPage);
            pageBaen.setCurrentPage(page);
            pageBaen.setNumPerPage(rows);
            pageBaen.setNextPage(totalPage - page == 0 ? page : page + 1);
            pageBaen.setPreviousPage(page - 0 == 1 ? page : page - 1);
            pageBaen.setHasPreviousPage(true);
            pageBaen.setHasNextPage(true);
            pageBaen.setFirstPage(true);
            pageBaen.setLastPage(true);
            return pageBaen;
      }

      @RequestMapping("/AddTi/")
      @ResponseBody
      public void AddCO(HttpServletResponse response,Ticket ticket, String table_data) {
            Msg msg = new Msg();
            JSONArray jsonArray = JSONArray.fromObject(table_data);
            Iterator<Object> it = jsonArray.iterator();
            //发票货物信息
            List<TicketProduct> list=new ArrayList<TicketProduct>();
            ticket.setFake(0);
            //添加发票信息
            int num=ticketService.addTi(ticket);
            if(num>0){
                  while (it.hasNext()) {
                        JSONObject obj = (JSONObject) it.next();
                        //添加产品信息
                        TicketProduct ticketProduct=new TicketProduct();
                        ticketProduct.setTicketId(ticket.getTicketId());
                        ticketProduct.setFake(0);
                        if(ticket.getType()==1){
                              ticketProduct.setTicketNum((Integer) obj.get("outNum"));
                              if(obj.get("cartonPrice")==null){
                                    ticketProduct.setTicketPrice(0.00);
                              }else{
                                    ticketProduct.setTicketPrice(Double.valueOf(obj.get("cartonPrice").toString()));
                              }
                              double fla=Double.valueOf(obj.get("cartonPrice").toString())*(Integer) obj.get("outNum");
                              ticketProduct.setTicketProductMoney(fla);
                              ticketProduct.setTicketProductName((String)obj.get("productName"));
                              ticketProduct.setTicketRate((String) obj.get("suil"));
                              if(obj.get("suie")==null){
                                    ticketProduct.setTicketRateAmount(0.00);
                              }else{
                                    ticketProduct.setTicketRateAmount(Double.valueOf(obj.get("suie").toString()));
                              }
                              ticketProduct.setTicketSpecModel("");
                              ticketProduct.setTicketUnit("个");
                              list.add(ticketProduct);
                        }else{

                              ticketProduct.setTicketProductName("纸板");
                              ticketProduct.setTicketUnit("片");
                              ticketProduct.setTicketPrice(Double.valueOf(obj.get("squarePrice").toString()));
                              ticketProduct.setTicketNum(Integer.valueOf(obj.get("num").toString()));
                              BigDecimal a1 = new BigDecimal(ticketProduct.getTicketPrice());
                              BigDecimal b1 = new BigDecimal(ticketProduct.getTicketNum());
                              double result = a1.multiply(b1).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
                              ticketProduct.setTicketProductMoney(result);
                              list.add(ticketProduct);
                        }
                  }
                  int n=ticketProductService.addTP(list);
                  if(n>0){
                        msg.setStatusCode("200");
                        msg.setTitle("操作提示");
                        msg.setMessage("添加成功！");
                  }else {
                        msg.setStatusCode("300");
                        msg.setTitle("操作提示");
                        msg.setMessage("添加失败！");

                  }

            }
            ResponseUtil.writeJson(response,msg);
      }

      //删除发票记录
      @RequestMapping("/updateFake/")
      @ResponseBody
      public void updateFake(HttpServletResponse response,String ticketId){
            Msg msg = new Msg();
            List<Ticket> list = new ArrayList<Ticket>();
            List<TicketProduct> listPro = new ArrayList<TicketProduct>();
            ticketId = ticketId.replaceAll("'","");
            String[] ticketIds = ticketId.split(",");
            for(int i=0;i<ticketIds.length;i++){
                  Ticket ticket = new Ticket();
                  TicketProduct ticketProduct = new TicketProduct();
                  ticket.setTicketId(Integer.valueOf(ticketIds[i]));
                  list.add(ticket);
                  ticketProduct.setTicketId(Integer.valueOf(ticketIds[i]));
                  listPro.add(ticketProduct);
            }
            int num = ticketService.updateFakes(list);
            if(num>0){
                  int n = ticketProductService.updateFakes(listPro);
                  if(n>0){
                        msg.setStatusCode("200");
                        msg.setTitle("操作提示");
                        msg.setMessage("操作成功！");
                  }else{
                        msg.setStatusCode("500");
                        msg.setTitle("操作提示");
                        msg.setMessage("操作失败！");
                  }
            }else{
                  msg.setStatusCode("500");
                  msg.setTitle("操作提示");
                  msg.setMessage("操作失败！");
            }
            ResponseUtil.writeJson(response,msg);
      }

      /**
       * 接收发票登记，加载出该供应商所有的采购单记录
       * @param page
       * @param limit
       * @param supplierId
       * @return
       */
      @RequestMapping("/findBySuppPurOrder/")
      @ResponseBody
      public pageBaen findBySuppPurOrder(int page,int limit,String supplierId){
            pageBaen pageBaen = new pageBaen();
            int cur = (page - 1) * limit;
            int supplier = 0;
            if(supplierId!=null && supplierId!=""){
                  supplier=Integer.valueOf(supplierId);
            }
            List<CartonPurchase> list = purchaseService.findBySuppPurOrder(cur,limit,supplier);
            List<CartonPurchase> listAll = purchaseService.findBySuppPurOrderAll(supplier);
            pageBaen.setCode(0);
            pageBaen.setCount(listAll.size());
            pageBaen.setData(list);
            pageBaen.setMsg("");
            return pageBaen;
      }
}