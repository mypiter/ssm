package com.generator.controller;

import com.generator.pojo.*;
import com.generator.service.CardboardEditService;
import com.generator.service.PurchaseStockService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 纸板库存调整
 */
@Controller
@RequestMapping("/CardboardEdit")
public class CardboardEditController {
    @Resource
    private CardboardEditService cardboardEditService;
    @Resource
    private PurchaseStockService purchaseStockService;

    /**
     * 查询出所有库存记录
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("/findByPurStockAll/")
    @ResponseBody
    public pageBaen findByPurStockAll(int page, int limit){
        pageBaen pageBaen = new pageBaen();
        int cur = (page-1)*limit;
        List<PurchaseStock> list = purchaseStockService.findNoByPurStock(cur,limit);
        List<PurchaseStock> listAll = purchaseStockService.findNoByPurStockAll();
        pageBaen.setCode(0);
        pageBaen.setCount(listAll.size());
        pageBaen.setData(list);
        pageBaen.setMsg("");
        return pageBaen;
    }

    /**
     * 新曾库存调整记录  批量
     * @param cardboardEdit
     * @param table_data
     * @return
     */
    @RequestMapping("/addCardEditS/")
    @ResponseBody
    public Msg addCardEditS(CardboardEdit cardboardEdit, String table_data){
        Msg msg = new Msg();
        List<CardboardEdit> list = new ArrayList<CardboardEdit>();
        List<PurchaseStock> lists = new ArrayList<PurchaseStock>();
        JSONArray jsonArray = JSONArray.fromObject(table_data);
        Iterator<Object> it = jsonArray.iterator();
        while (it.hasNext()){
            JSONObject obj = (JSONObject) it.next();
            CardboardEdit carEdit = new CardboardEdit();
            PurchaseStock purStock = new PurchaseStock();

            carEdit.setEditTime(cardboardEdit.getEditTime());
            carEdit.setEditTye(cardboardEdit.getEditTye());
            carEdit.setEditName(cardboardEdit.getEditName());
            carEdit.setFake(0);

            carEdit.setOrderAcount((String) obj.get("orderAccount"));
            carEdit.setEditPrice(Double.valueOf(obj.get("price").toString()));
            carEdit.setEditOutNum(Integer.valueOf(obj.get("outNum").toString()));
            carEdit.setEditNum(Integer.valueOf(obj.get("stockNum").toString()));
            carEdit.setEditLoan(Integer.valueOf(obj.get("n").toString()));
            if(!(obj.get("editPrices").toString().equals(""))){
                carEdit.setEditPrices(Double.valueOf(obj.get("editPrices").toString()));
                purStock.setStockId(Integer.valueOf(obj.get("stockId").toString()));
                purStock.setPrice(Double.valueOf(obj.get("editPrices").toString()));
            }
            if(!(obj.get("editOutNums").toString().equals(""))){
                carEdit.setEditOutNums(Integer.valueOf(obj.get("editOutNums").toString()));
                purStock.setStockId(Integer.valueOf(obj.get("stockId").toString()));
                purStock.setOutNum(Integer.valueOf(obj.get("editOutNums").toString()));

            }
            if(!(obj.get("editNums").toString().equals(""))){
                carEdit.setEditNums(Integer.valueOf(obj.get("editNums").toString()));
                purStock.setStockId(Integer.valueOf(obj.get("stockId").toString()));
                purStock.setStockNum(Integer.valueOf(obj.get("editNums").toString()));
            }
            if(!(obj.get("editLoans").toString().equals(""))){
                carEdit.setEditLoans(Integer.valueOf(obj.get("editLoans").toString()));
                purStock.setStockId(Integer.valueOf(obj.get("stockId").toString()));
                purStock.setN((String) obj.get("editLoans"));
            }
            carEdit.setEditRemark((String) obj.get("editRemark"));
            list.add(carEdit);
            lists.add(purStock);
        }
        int num = cardboardEditService.addCardEditS(list);//批量添加调整记录
        if(num>0){
            int n = purchaseStockService.updateByEditS(lists);//批量调整库存记录
            if(n>0){
                msg.setStatusCode("200");
                msg.setTitle("操作提示");
                msg.setMessage("添加成功!");
            }else{
                msg.setStatusCode("300");
                msg.setTitle("操作提示");
                msg.setMessage("添加失败");
            }
        }else{
            msg.setStatusCode("300");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败");
        }
        return msg;
    }

    //纸板库存调整列表 查询所有的库存调整记录
    @RequestMapping("/findByPurEdit/")
    @ResponseBody
    public pageBaen findByPurEdit(int page,int rows,String sort,String order,String advanceFilter,String startTime,String endTime,String orderAccount,String type){
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
        List<CardboardEdit> list = new ArrayList<CardboardEdit>();
        List<CardboardEdit> listAll =  new ArrayList<CardboardEdit>();
        if(type!=null){
            if(orderAccount!=null){
                list = cardboardEditService.findByPurEdit(cur,rows,sort,order,queryList,startTime,endTime,orderAccount);
                listAll = cardboardEditService.findByPurEditAll(queryList,startTime,endTime,orderAccount);
            }
        }else{
            list = cardboardEditService.findByPurEdit(cur,rows,sort,order,queryList,startTime,endTime,orderAccount);
            listAll = cardboardEditService.findByPurEditAll(queryList,startTime,endTime,orderAccount);
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
