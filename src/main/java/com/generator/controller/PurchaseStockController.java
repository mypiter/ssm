package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Msg;
import com.generator.pojo.PurchaseStock;
import com.generator.pojo.pageBaen;
import com.generator.service.PurchaseStockService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 纸板库存
 */
@Controller
@RequestMapping("/PurchaseStock")
public class PurchaseStockController {
    private static final Logger LOG = LoggerFactory.getLogger(PurchaseStockController.class);

    @Resource
    private PurchaseStockService purchaseStockService;

    /**
     * 纸板库存报表 加载出所有的库存记录
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @param advanceFilter
     * @return
     */
    @RequestMapping("/findByPurStock/")
    @ResponseBody
    public pageBaen findByPurStock(int page, int rows, String sort, String order, String advanceFilter){
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
        List<PurchaseStock> list = purchaseStockService.findByCarStock(cur,rows,sort,order,queryList);
        List<PurchaseStock> listAll = purchaseStockService.findByCarStockAll(queryList);
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

    /**
     * 删除库存记录
     * @param stockId
     * @param stockNum
     * @param outNum
     * @param n
     * @return
     */
    @RequestMapping("/deleteByPurStock/")
    @ResponseBody
    public void deleteByPurStock(HttpServletResponse response,String stockId, String orderAccount, String stockNum, String outNum, String n){
        Msg msg = new Msg();
        List<PurchaseStock> list = new ArrayList<PurchaseStock>();
        String stockIds = stockId.replaceAll("'","");
        String orderAccounts = orderAccount.replaceAll("'","");
        String stockNums = stockNum.replaceAll("'","");
        String outNums = outNum.replaceAll("'","");
        String ns = n.replaceAll("'","");
        String[] stockIdS = stockIds.split(",");
        String[] orderAccountS = orderAccounts.split(",");
        String[] stockNumS = stockNums.split(",");
        String[] outNumS = outNums.split(",");
        String[] nS = ns.split(",");
        for(int i=0;i<stockIdS.length;i++){
            int stockN = Integer.valueOf(stockNumS[i].trim())-Integer.valueOf(outNumS[i].trim())-Integer.valueOf(nS[i].trim());
            if(stockN==0){
                PurchaseStock purchaseStock = new PurchaseStock();
                purchaseStock.setStockId(Integer.valueOf(stockIdS[i].trim()));
                list.add(purchaseStock);
            }else{
                msg.setStatusCode("500");
                msg.setTitle("操作提示");
                msg.setMessage("订单"+orderAccountS[i]+"还有库存，删除失败!");
                ResponseUtil.writeJson(response,msg);
            }
        }
        int num = purchaseStockService.updateByPurFake(list);
        if(num>0){
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("库存删除成功!");
        }else{
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("库存删除失败!");
        }
        ResponseUtil.writeJson(response,msg);
    }

}
