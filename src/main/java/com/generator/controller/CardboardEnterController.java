package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.*;
import com.generator.service.CardboardEnterService;
import com.generator.service.PurchaseService;
import com.generator.service.PurchaseStockService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 纸板入库
 */
@Controller
@RequestMapping("/CardboardEnter")
public class CardboardEnterController {
    private static final Logger LOG = LoggerFactory.getLogger(CardboardEnterController.class);

    @Resource
    private PurchaseService purchaseService;//采购单业务

    @Resource
    private CardboardEnterService cardboardEnterService;//纸板入库业务

    @Resource
    private PurchaseStockService purchaseStockService;//纸板库存业务

    /**
     * 查询出需要入库的采购单，到料数量小于采购数量的采购单
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("/findByEnter/")
    @ResponseBody
    public pageBaen findByEnter(int page,int limit,String purchaseAccount,String supplierId,String ty){
        pageBaen pageBaen = new pageBaen();
        int cur = (page - 1) * limit;
        int supplier = 0;
        int tys = 0;
        if(supplierId!=null && supplierId!=""){
            supplier=Integer.valueOf(supplierId);
        }
        if(ty!=null && ty!=""){
            tys=Integer.valueOf(ty);
        }
        List<CartonPurchase> list = purchaseService.findByEnter(cur,limit,purchaseAccount,supplier,tys);
        List<CartonPurchase> listAll = purchaseService.findByEnterAll(purchaseAccount,supplier,tys);
        pageBaen.setCode(0);
        pageBaen.setCount(listAll.size());
        pageBaen.setData(list);
        pageBaen.setMsg("");
        return pageBaen;
    }

    /**
     * 下拉框采购单号查询
     * @param q
     * @return
     */
    @RequestMapping("/dropSelectPurchase/")
    @ResponseBody
    public pageBaen dropSelectPurchase(String q){
        pageBaen pages = new pageBaen();
        List<CartonPurchase> list = purchaseService.dropSelectPurchase(q);
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
     * 下拉框供应商
     * @param q
     * @return
     */
    @RequestMapping("/dropSupper/")
    @ResponseBody
    public pageBaen dropSupper(String q){
        pageBaen pages = new pageBaen();
        List<CartonPurchase> list = purchaseService.dropSupper(q);
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
     * 新增入库记录
     * @param cardboardEnter
     * @param table_data
     * @return
     */
    @RequestMapping("/addCarEnterRecord/")
    @ResponseBody
    public void addCarEnterRecord(HttpServletResponse response,CardboardEnter cardboardEnter, String table_data){
        Msg msg = new Msg();
        List<CardboardEnter> list = new ArrayList<CardboardEnter>();//纸板入库记录list集合
        List<CartonPurchase> lists = new ArrayList<CartonPurchase>();//采购单对象集合
        List<PurchaseStock> PurStocks = new ArrayList<PurchaseStock>();//纸板库存记录集合

        JSONArray jsonArray = JSONArray.fromObject(table_data);
        Iterator<Object> it = jsonArray.iterator();
        while (it.hasNext()){
            JSONObject obj = (JSONObject) it.next();//迭代器拿到下一个对象
            CartonPurchase cartonPurchase = new CartonPurchase();//采购单对象
            PurchaseStock purchaseStock = new PurchaseStock();//纸板库存记录对象
            CardboardEnter cardEnter = new CardboardEnter();//纸板入库记录对象

            /*纸板入库记录list封装 start*/
            cardEnter.setBatch(cardboardEnter.getBatch());
//            cardEnter.setOrderAccount(cardboardEnter.getOrderAccount());
            cardEnter.setReservoir(cardboardEnter.getReservoir());
//            cardEnter.setSupplierName(cardboardEnter.getSupplierName());
            cardEnter.setSongMr(cardboardEnter.getSongMr());
            cardEnter.setTime(cardboardEnter.getTime());
            cardEnter.setCarNumber(cardboardEnter.getCarNumber());
            cardEnter.setGongNumber(cardboardEnter.getGongNumber());
            cardEnter.setContent(cardboardEnter.getContent());
            cardEnter.setFake(0);

            cardEnter.setSupplierName((String) obj.get("supplierName"));
            cardEnter.setOrderAccount((String) obj.get("purchaseAccount"));
            cardEnter.setOrderId((String) obj.get("orderAccount"));
            cardEnter.setCustomName((String) obj.get("customName"));
            cardEnter.setCartonName((String) obj.get("cartonName"));
            cardEnter.setPurchaseNumber(Integer.valueOf(obj.get("num").toString()));
            cardEnter.setSupperSpec((String) obj.get("supperSpec"));
            cardEnter.setMaterialScience((String) obj.get("cardboardSpec"));
            cardEnter.setSize((String) obj.get("blankingSize"));
            cardEnter.setPitType((String) obj.get("pitType"));
            cardEnter.setWidthLine((String) obj.get("widthLine"));
            cardEnter.setLineType(Integer.valueOf(obj.get("lineType").toString()));
            cardEnter.setPrice(Double.valueOf(obj.get("squarePrice").toString()));
            cardEnter.setPalletNumber(Integer.valueOf(obj.get("palletNumber").toString()));
            cardEnter.setReturnNumber(Integer.valueOf(obj.get("returnNumber").toString()));
            cardEnter.setSingular(Integer.valueOf(obj.get("singular").toString()));
            cardEnter.setDifference(Integer.valueOf(obj.get("difference").toString()));
            cardEnter.setNum(Integer.valueOf(obj.get("enterNum").toString()));
            cardEnter.setEnterContent((String) obj.get("enterContent"));
            list.add(cardEnter);//纸板入库记录list封装
            /*纸板入库记录list封装 end*/

            /*采购单修改参数list封装 start*/
            cartonPurchase.setPurchaseId(Integer.valueOf(obj.get("purchaseId").toString()));//采购单id
            cartonPurchase.setEndNum(cardEnter.getNum());//到料数量
            lists.add(cartonPurchase);//采购单修改参数封装
            /*采购单修改参数list封装 end*/

            /*纸板库存记录list封装 start*/
            purchaseStock.setOrderAccount((String) obj.get("orderAccount"));
            purchaseStock.setCustomName((String) obj.get("customName"));
            purchaseStock.setCartonName((String) obj.get("cartonName"));
            purchaseStock.setMaterialScience((String) obj.get("cardboardSpec"));
            purchaseStock.setFluteType((String) obj.get("pitType"));
            purchaseStock.setPurchaseSpec((String) obj.get("blankingSize"));
            purchaseStock.setWidthLine((String) obj.get("widthLine"));
            purchaseStock.setLineType(Integer.valueOf(obj.get("lineType").toString()));
            purchaseStock.setOutNum(0);
            purchaseStock.setStockNum(Integer.valueOf(obj.get("enterNum").toString()));
            purchaseStock.setPrice(Double.valueOf(obj.get("squarePrice").toString()));
            purchaseStock.setFake(0);
            purchaseStock.setN("0");
            PurStocks.add(purchaseStock);
            /*纸板库存记录list封装 end*/

        }
        int num = cardboardEnterService.addCarEnterRecordS(list);
        if(num>0){//批量添加入库记录成功，修改采购单的到料数量，批量
            int n = purchaseService.updateByEndNums(lists);//批量修改到料数量
            if(n>0){//批量修改采购单的到料数量成功，下来就是批量添加入库纸板的库存记录了
                int n1 = purchaseStockService.addPurStockS(PurStocks);//MySQL insert 存在则更新,不存在则插入
                if(n1>0){
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

    /**
     * 纸板入库报表查询所有的纸板入库记录
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @param advanceFilter
     * @param startTime
     * @param endTime
     * @return
     */
    @RequestMapping("/getPurEnter/")
    @ResponseBody
    public pageBaen getPurEnter(int page,int rows,String sort,String order,String advanceFilter,String startTime,String endTime,String orderAccount,String type){
        pageBaen pageBaen=new pageBaen();
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
        List<CardboardEnter> list = new ArrayList<CardboardEnter>();
        List<CardboardEnter> listAll = new ArrayList<CardboardEnter>();
        if (type!=null) {
            if(orderAccount!=null){
                list = cardboardEnterService.findByPurEnter(cur,rows,sort,order,queryList,startTime,endTime,orderAccount);
                listAll = cardboardEnterService.findByPurEnterAll(queryList,startTime,endTime,orderAccount);
            }
        }else{
            list = cardboardEnterService.findByPurEnter(cur,rows,sort,order,queryList,startTime,endTime,orderAccount);
            listAll = cardboardEnterService.findByPurEnterAll(queryList,startTime,endTime,orderAccount);
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

    /**
     * 纸板入库记录下拉框查询
     * @param q
     * @return
     */
    @RequestMapping("/dropSelectPurEnter/")
    @ResponseBody
    public pageBaen dropSelectPurEnter(String q){
        pageBaen pages = new pageBaen();
        List<CardboardEnter> list = cardboardEnterService.dropSelectPurEnter(q);
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
     * 纸板入库批号生成
     * @param time
     * @return
     */
    @RequestMapping("/generateCardEnter/")
    @ResponseBody
    public CardboardEnter generateCardEnter(String time){
        CardboardEnter cardboardEnter = new CardboardEnter();
        String time1 = "ZBR"+time;
        CardboardEnter cardboardEnters = cardboardEnterService.getMaxEnterOrder(time1);
        if(cardboardEnters==null){
            cardboardEnter.setBatch(time1+"0001");
        }else{
            String enterOrder = cardboardEnters.getBatch().substring(cardboardEnters.getBatch().length()-4);
            int enterAccount = Integer.valueOf(enterOrder)+1;
            //如果不足4位前面补0
            String str = String.format("%04d", enterAccount);
            cardboardEnter.setBatch(time1+str);
        }
        return cardboardEnter;
    }

    /**
     * 跳转到入库标签页面
     * @param url
     * @param enterId
     * @return
     */
    @RequestMapping("/jumpLabel/")
    public ModelAndView jumpLabel(String url,String enterId){
        ModelAndView modelAndView  = new ModelAndView();
        String[] enterIds = enterId.split(",");
        List<CardboardEnter> list = new ArrayList<>();
        for (int i = 0; i < enterIds.length; i++) {
            CardboardEnter cardboardEnter = new CardboardEnter();
            cardboardEnter.setPurId(Integer.valueOf(enterIds[i]));
            list.add(cardboardEnter);
        }
        List<StorageLabel> listEnter = cardboardEnterService.getListByPurId(list);
        for (int i = 0; i < listEnter.size(); i++) {
            List<StorageLabel> listEnters = new ArrayList<>();
            StorageLabel storageLabel = listEnter.get(i);
            if(storageLabel.getPalletNumber()>0){
                for (int j=0;j<storageLabel.getPalletNumber();j++){
                    listEnters.add(storageLabel);
                }
            }else{
                listEnters.add(storageLabel);
            }
            storageLabel.setList(listEnters);
        }

        modelAndView.addObject("listEnter",listEnter);
        modelAndView.setViewName(url);
        return modelAndView;
    }

}
