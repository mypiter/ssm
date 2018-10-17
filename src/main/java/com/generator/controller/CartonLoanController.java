package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.CartonLoan;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Msg;
import com.generator.pojo.pageBaen;
import com.generator.service.CartonLoanService;
import com.generator.service.CartonStockService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import static com.generator.common.SystemException.unAbs;

/**
 * 纸箱借调
 */
@RequestMapping("/CartonLoan")
@Controller
public class CartonLoanController {
    @Resource
    private CartonLoanService cartonLoanService;
    @Resource
    private CartonStockService cartonStockService;
    @RequestMapping("/addLoan/")
    @ResponseBody
    public void addLoan(HttpServletResponse response,CartonLoan cartonLoan){
        Msg msg=new Msg();
        //添加借调记录
        int num = cartonLoanService.addLoan(cartonLoan);
        if(num>0){
            //根据订单号修改被订单库存(减数)
            int n=cartonStockService.updateById(cartonLoan.getbOrderAccount(),unAbs(cartonLoan.getCartonLoanNum()),0);
            //根据订单号修改目标定单库存（加数）
            int m=cartonStockService.updateById(cartonLoan.getOrderAccount(),cartonLoan.getCartonLoanNum(),0);
            if (n>0&&m>0){
                msg.setStatusCode("200");
                msg.setTitle("操作提示");
                msg.setMessage("借调成功！");
            }else{
                msg.setStatusCode("500");
                msg.setTitle("操作提示");
                msg.setMessage("借调失败！");
            }
        }else{
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("借调失败！");
        }
        ResponseUtil.writeJson(response,msg);
    }
    //借调记录查询
    @RequestMapping("/findlist/")
    @ResponseBody
    public pageBaen findlist(int page,int rows,String sort,String order,String advanceFilter,String startTime,String endTime){
        pageBaen pages=new pageBaen();
        List<ComplexQuery> queryList = new ArrayList<ComplexQuery>();
        int cur = (page - 1) * rows;
        String sql = "and fake=0";
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
        List<CartonLoan> list = cartonLoanService.selectTopjui(cur, rows, sort, order, queryList,startTime,endTime);
        List<CartonLoan> listAll = cartonLoanService.selectTop(queryList,startTime,endTime);
        pages.setTotal(listAll.size());
        pages.setRows(list);
        int total = listAll.size();
        int totalPage = total % rows == 0 ? (total / rows) : (total / rows) + 1;//总页数
        pages.setTotalPage(totalPage);
        pages.setCurrentPage(page);
        pages.setNumPerPage(rows);
        pages.setNextPage(totalPage - page == 0 ? page : page + 1);
        pages.setPreviousPage(page - 0 == 1 ? page : page - 1);
        pages.setHasPreviousPage(true);
        pages.setHasNextPage(true);
        pages.setFirstPage(true);
        pages.setLastPage(true);
        return pages;
    }
    //借调记录查询根据订单号
    @RequestMapping("/findByNum/")
    @ResponseBody
    public pageBaen findByNum(int page,int rows,String orderAccount){
        pageBaen pages=new pageBaen();
        int cur = (page - 1) * rows;
        List<CartonLoan> list = cartonLoanService.findByNum(orderAccount);
        pages.setTotal(list.size());
        pages.setRows(list);
        int total = list.size();
        int totalPage = total % rows == 0 ? (total / rows) : (total / rows) + 1;//总页数
        pages.setTotalPage(totalPage);
        pages.setCurrentPage(page);
        pages.setNumPerPage(rows);
        pages.setNextPage(totalPage - page == 0 ? page : page + 1);
        pages.setPreviousPage(page - 0 == 1 ? page : page - 1);
        pages.setHasPreviousPage(true);
        pages.setHasNextPage(true);
        pages.setFirstPage(true);
        pages.setLastPage(true);
        return pages;
    }

}
