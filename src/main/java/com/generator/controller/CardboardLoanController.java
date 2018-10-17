package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.*;
import com.generator.service.CardboardLoanService;
import com.generator.service.PlaceService;
import com.generator.service.PurchaseStockService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * 纸板借调
 */
@Controller
@RequestMapping("/CardboardLoan")
public class CardboardLoanController {
    @Resource
    private PurchaseStockService purchaseStockService;
    @Resource
    private PlaceService placeService;
    @Resource
    private CardboardLoanService cardboardLoanService;

    /**
     * 查询出所有可借调的库存记录列表  分页
     * 并且带筛选功能
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("/findByPurStock/")
    @ResponseBody
    public pageBaen findByPurStock(int page,int limit,String orderAccount,String purchaseSpec,String fluteType,String chang,String k,String minNum,String maxNum){
        pageBaen pageBaen = new pageBaen();
        int cur = (page-1)*limit;
        String cartonSize;
        if(chang==null&&k==null || chang==""&&k==""){
            cartonSize = null;
        }else{
            cartonSize = chang+"X"+k;
        }
        List<PurchaseStock> list = purchaseStockService.findByPurStockSloan(cur,limit,orderAccount,purchaseSpec,fluteType,cartonSize,minNum,maxNum);
        List<PurchaseStock> listAll = purchaseStockService.findByPurStockAllloan(orderAccount,purchaseSpec,fluteType,cartonSize,minNum,maxNum);
        pageBaen.setCode(0);
        pageBaen.setCount(listAll.size());
        pageBaen.setData(list);
        pageBaen.setMsg("");
        return pageBaen;
    }

    /**
     * 纸板库存中的订单 下拉框查询
     * @param q
     * @return
     */
    @RequestMapping("/dropSelectPlace/")
    @ResponseBody
    public pageBaen dropSelectPlace(String q){
        pageBaen pages = new pageBaen();
        List<PurchaseStock> list = purchaseStockService.dropSelectPlace(q);
        pages.setRows(list);
        int total=list.size();
        pages.setTotal(total);
        int totalPage=1;
        pages.setTotalPage(totalPage);
        pages.setCurrentPage(1);
        pages.setNumPerPage(20);
        pages.setNextPage(1);
        pages.setPreviousPage(1);
        pages.setHasPreviousPage(false);
        pages.setHasNextPage(false);
        pages.setFirstPage(true);
        pages.setLastPage(true);
        return pages;
    }

    /**
     * 查询订单号是否是待采购订单
     * @param orderAccount
     * @return
     */
    @RequestMapping("/findByIsPur/")
    @ResponseBody
    public List<Place> findByIsPur(String orderAccount){
        List<Place> list = new ArrayList<Place>();
        Place p = placeService.findById(orderAccount);
        if(p!=null){
            list.add(p);
        }
        return list;
    }

    /**
     * 新增纸板使用调整
     * @param table_data
     * @return
     */
    @RequestMapping("/addCarLoanS/")
    @ResponseBody
    public void addCarLoanS(HttpServletResponse response,String table_data){
        Msg msg= new Msg();
        List<CardboardLoan> list = new ArrayList<CardboardLoan>();//新增纸板借调记录
        List<PurchaseStock> lists = new ArrayList<PurchaseStock>();//修改纸板库存借调数
        List<PurchaseStock> listss = new ArrayList<PurchaseStock>();//新增借调的订单纸板库存
        JSONArray jsonArray = JSONArray.fromObject(table_data);
        Iterator<Object> it = jsonArray.iterator();
        while (it.hasNext()){
            JSONObject obj = (JSONObject) it.next();
            CardboardLoan cardboardLoan = new CardboardLoan();
            PurchaseStock purchaseStock = new PurchaseStock();
            PurchaseStock purchaseStocks = new PurchaseStock();

            cardboardLoan.setOrderAccount((String) obj.get("orderAccount"));
            cardboardLoan.setOrderAccounts((String) obj.get("orderAccounts"));
            cardboardLoan.setOrderAccountsNum(Integer.valueOf(obj.get("orderAccountsNum").toString()));
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            cardboardLoan.setCartonLoanTime(df.format(new Date()));
            cardboardLoan.setMaterial((String) obj.get("materialScience"));
            cardboardLoan.setFluteType((String) obj.get("fluteType"));
            cardboardLoan.setSize((String) obj.get("purchaseSpec"));
            cardboardLoan.setWidthLine((String) obj.get("widthLine"));
            cardboardLoan.setLineType(Integer.valueOf(obj.get("lineType").toString()));
            cardboardLoan.setPrice(Double.valueOf(obj.get("price").toString()));
            cardboardLoan.setFake(0);
            list.add(cardboardLoan);//纸板借调记录

            purchaseStock.setStockId(Integer.valueOf(obj.get("stockId").toString()));
            purchaseStock.setN((String) obj.get("orderAccountsNum"));
            lists.add(purchaseStock);//纸板库存记录借调数的修改

            purchaseStocks.setOrderAccount((String) obj.get("orderAccounts"));
            purchaseStocks.setMaterialScience((String) obj.get("materialScience"));
            purchaseStocks.setFluteType((String) obj.get("fluteType"));
            purchaseStocks.setPurchaseSpec((String) obj.get("purchaseSpec"));
            purchaseStocks.setWidthLine((String) obj.get("widthLine"));
            purchaseStocks.setLineType(Integer.valueOf(obj.get("lineType").toString()));
            purchaseStocks.setOutNum(0);
            purchaseStocks.setStockNum(Integer.valueOf(obj.get("orderAccountsNum").toString()));
            purchaseStocks.setPrice(Double.valueOf(obj.get("price").toString()));
            purchaseStocks.setFake(0);
            purchaseStocks.setN("0");
            listss.add(purchaseStocks);//借调纸板 订单的纸板库存记录新增
        }
        int num = cardboardLoanService.addCarLoanS(list);//批量添加纸板借调新纪录
        if(num>0){
            int num1 = purchaseStockService.updateByN(lists);//批量修改订单纸板库存的借调数
            if(num1>0){
                int num2 = purchaseStockService.addPurStockS(listss);//借调纸板 订单的纸板库存记录新增
                if(num2>0){
                    msg.setStatusCode("200");
                    msg.setTitle("操作提示");
                    msg.setMessage("添加成功!");
                }else{
                    msg.setStatusCode("300");
                    msg.setTitle("操作提示");
                    msg.setMessage("添加失败!");
                }
            }else{
                msg.setStatusCode("300");
                msg.setTitle("操作提示");
                msg.setMessage("添加失败!");
            }
        }else{
            msg.setStatusCode("300");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败!");
        }
        ResponseUtil.writeJson(response,msg);
    }

    //纸板借调统计报表 查询所有的纸板借调记录
    @RequestMapping("/findByCardLoan/")
    @ResponseBody
    public pageBaen findByCardLoan(int page,int rows,String sort,String order,String advanceFilter,String startTime,String endTime,String orderAccount,String type){
        pageBaen pageBaen = new pageBaen();
        int cur = (page-1)*rows;
        List<ComplexQuery> queryList = new ArrayList<ComplexQuery>();
        if(advanceFilter!=null && advanceFilter!="[]"){
            JSONArray jsonArray=JSONArray.fromObject(advanceFilter);
            Iterator<Object> it = jsonArray.iterator();
            while (it.hasNext()){
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
        List<CardboardLoan> list = new ArrayList<CardboardLoan>();
        List<CardboardLoan> listAll =  new ArrayList<CardboardLoan>();
        if(type!=null){
            if(orderAccount!=null){
                list = cardboardLoanService.findByCardLoan(cur,rows,sort,order,queryList,startTime,endTime,orderAccount);
                listAll = cardboardLoanService.findByCardLoanAll(queryList,startTime,endTime,orderAccount);
            }
        }else{
            list = cardboardLoanService.findByCardLoan(cur,rows,sort,order,queryList,startTime,endTime,orderAccount);
            listAll = cardboardLoanService.findByCardLoanAll(queryList,startTime,endTime,orderAccount);
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
