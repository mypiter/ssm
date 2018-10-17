package com.generator.controller;


import com.generator.pojo.*;
import com.generator.service.CartonStockService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 纸箱库存
 */
@RequestMapping("/CartonStock")
@Controller
public class CartonStockController {
       @Resource
       private CartonStockService cartonStockService;

       @RequestMapping("/findAll/")
       @ResponseBody
       public pageBaen findAll(int page,int limit,String orderAccount,String purchaseSpec,String fluteType,String chang,String k,String h,String minNum,String maxNum) {
              pageBaen pageBaen = new pageBaen();
              String cartonSize;
              if(chang==null&&k==null || chang==""&&k==""){
                     cartonSize = null;
              }else{
                     cartonSize = chang+"X"+k+"X"+h;
              }

              List<CartonStock> list = new ArrayList<CartonStock>();
              int cur = (page - 1) * limit;
              list = cartonStockService.selectAl(cur,limit,orderAccount,purchaseSpec,fluteType,cartonSize,minNum,maxNum);
              pageBaen.setCode(0);
              pageBaen.setCount(list.size());
              pageBaen.setData(list);
              pageBaen.setMsg("");
              return pageBaen;
       }
       @RequestMapping("/findByCu/")
       @ResponseBody
       public pageBaen findByCu(int page,int limit,String customName){
              pageBaen pageBaen = new pageBaen();
              List<CartonStock> list = new ArrayList<CartonStock>();
              int cur = (page - 1) * limit;
              list = cartonStockService.selectAll(cur,limit,customName);
              pageBaen.setCode(0);
              pageBaen.setCount(list.size());
              pageBaen.setData(list);
              pageBaen.setMsg("");
              return pageBaen;
       }
       @RequestMapping("/findA/")
       @ResponseBody
       public pageBaen findA(int page,int rows,String sort,String order,String advanceFilter,String customer,String stime){
              pageBaen pageBaen = new pageBaen();
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
              //查询往期的库存（入参:客户名称，时间节点）
              if(customer!=null&&stime!=null){
                  //根据客户名称时间节点查询出入库记录

                  //出库减库存，入库加库存

                  //返回数据
                  pageBaen.setTotal(0);
                  pageBaen.setRows("");
                  int total = 0;
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
              }else{
                  List<CartonStock> list = cartonStockService.selectTopjui(cur, rows, sort, order, queryList);
                  List<CartonStock> listAll = cartonStockService.selectTop(queryList);
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
              }

              return pageBaen;
       }
       @RequestMapping("/findByCustom/")
       @ResponseBody
       public List<CartonStock> findByCustom(String customName){
              List<CartonStock>list=new ArrayList<CartonStock>();
              list=cartonStockService.findByCustom(customName);
              return list;
       }

       /**
        * 跳转到并填充数据到配送详情页面
        * @param url
        * @param orderAccount
        * @return
        */
       @RequestMapping("/jumpCartonInfo/")
       public ModelAndView jumpCartonInfo(String url, String orderAccount){
              ModelAndView modelAndView = new ModelAndView();
              CartonStock cartonStock = cartonStockService.findById(orderAccount);
              modelAndView.addObject("cartonStock",cartonStock);
              modelAndView.setViewName(url);
              return modelAndView;
       }
}
