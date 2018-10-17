package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.*;
import com.generator.service.CartonwarehousingService;
import com.generator.service.OutStorageService;
import com.generator.service.PlaceService;
import com.generator.service.PurchaseStockService;
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

/**
 * 纸板领料
 */
@RequestMapping("/OutStorage")
@Controller
public class OutStorageController {
    @Resource
    private OutStorageService outStorageService;
    @Resource
    private CartonwarehousingService cartonwarehousingService;
    @Resource
    private PlaceService placeService;
    @Resource
    private PurchaseStockService purchaseStockService;//纸板库存业务

    @RequestMapping("/findAll/")
    @ResponseBody
    public pageBaen findAll(int page,int limit,String orderAccount,String purchaseSpec,String fluteType,String chang,String k,String minNum,String maxNum){
        pageBaen pageBaen = new pageBaen();
        int cur = (page - 1) * limit;
        List<OutStorage> list=new ArrayList<OutStorage>();
        list=outStorageService.selectAll(cur,limit,orderAccount,purchaseSpec,fluteType,chang,k,minNum,maxNum);
//        List<OutStorage> listAll = outStorageService.selectAllS();

        //遍历list
        Iterator<OutStorage> it = list.iterator();
        while (it.hasNext()){
            OutStorage outStorage=it.next();
            Place place=placeService.findById(outStorage.getOrderAccount());
            if(place!=null){
                int nums=outStorage.getNum();
                //获取开数
                String a=place.getOpenNumber();
                int cp=outStorage.getCprk();
                int jh=Integer.parseInt(a)*nums;
                if(cp>=jh){
                    it.remove();
                }
            }

        }
        pageBaen.setCode(0);
        pageBaen.setCount(list.size());
        pageBaen.setData(list);
        pageBaen.setMsg("");
         return pageBaen;
    }

    /**
     * 查询出所有可出库的 库存记录
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("/findByPurStockS/")
    @ResponseBody
    public pageBaen findByPurStockS(int page,int limit){
        pageBaen pageBaen = new pageBaen();
        int cur = (page - 1) * limit;
        List<PurchaseStock> list = purchaseStockService.findByPurStockS(cur,limit);
        List<PurchaseStock> listAll = purchaseStockService.findByPurStockAll();
        pageBaen.setCode(0);
        pageBaen.setCount(listAll.size());
        pageBaen.setData(list);
        pageBaen.setMsg("");
        return pageBaen;
    }

    /**
     * 批量 新增纸板出库记录
     * @param outStorage
     * @param table_data
     * @return
     */
    @RequestMapping("/addOutStoragerS/")
    @ResponseBody
    public void addOutStoragerS(HttpServletResponse response,OutStorage outStorage, String table_data){
        Msg msg = new Msg();
        List<OutStorage> list = new ArrayList<OutStorage>();
        List<PurchaseStock> lists = new ArrayList<PurchaseStock>();
        JSONArray jsonArray = JSONArray.fromObject(table_data);
        Iterator<Object> it = jsonArray.iterator();
        while (it.hasNext()){
            JSONObject obj = (JSONObject) it.next();//迭代器拿到下一个对象
            OutStorage outS = new OutStorage();//出库记录对象list封装
            PurchaseStock purStock = new PurchaseStock();//库存记录对象list封装

            outS.setPurNumber(outStorage.getPurNumber());
            outS.setAdminName(outStorage.getAdminName());
            outS.setTime(outStorage.getTime());
            outS.setLeader(outStorage.getLeader());
            outS.setFake(0);

            outS.setOrderAccount((String) obj.get("orderAccount"));
            outS.setCustomName((String) obj.get("customName"));
            outS.setCartonName((String) obj.get("cartonName"));
            outS.setMaterialScience((String) obj.get("materialScience"));
            String purchase_spec = (String) obj.get("purchaseSpec");
            String[] size =  purchase_spec.split("X");
            outS.setCardboardLength(Double.valueOf(size[0].trim()));
            outS.setCardboardWidth(Double.valueOf(size[1].trim()));
            outS.setPitType((String) obj.get("fluteType"));
            outS.setWidthLine((String) obj.get("widthLine"));
            outS.setLineType((Integer) obj.get("lineType"));
            outS.setNum(Integer.valueOf(obj.get("num").toString()));
            outS.setCprk(0);
            list.add(outS);

            purStock.setStockId(Integer.valueOf(obj.get("stockId").toString()));
            purStock.setOutNum(Integer.valueOf(obj.get("num").toString()));
            lists.add(purStock);
        }
        int num = outStorageService.addOutStoragerS(list);//批量添加出库记录
        if(num>0){//批量添加成功之后就是批量修改 ”库存记录“ 中的已出库数变量了
            int n = purchaseStockService.updateByOutNumS(lists);//批量修改库存记录中的出库数量
            if(n>0){
                msg.setStatusCode("200");
                msg.setTitle("操作提示");
                msg.setMessage("添加成功!");
            }else{
                msg.setStatusCode("300");
                msg.setTitle("操作提示");
                msg.setMessage("添加失败！");
            }
        }else{
            msg.setStatusCode("300");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败!");
        }
        ResponseUtil.writeJson(response,msg);
    }

    /**
     * 纸板出库记录报表  查询出所有的出库记录
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @param advanceFilter
     * @param startTime
     * @param endTime
     * @return
     */
    @RequestMapping("/findByPurOut/")
    @ResponseBody
    public pageBaen findByPurOut(int page,int rows,String sort,String order,String advanceFilter,String startTime,String endTime,String orderAccount,String type){
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
        List<OutStorage> list = new ArrayList<OutStorage>();
        List<OutStorage> listAll =  new ArrayList<OutStorage>();
        if(type!=null){
            if(orderAccount!=null){
                list = outStorageService.findByPurOut(cur,rows,sort,order,queryList,startTime,endTime,orderAccount);
                listAll = outStorageService.findByPurOutAll(queryList,startTime,endTime,orderAccount);
            }
        }else{
            list = outStorageService.findByPurOut(cur,rows,sort,order,queryList,startTime,endTime,orderAccount);
            listAll = outStorageService.findByPurOutAll(queryList,startTime,endTime,orderAccount);
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
     * 生成出库批号
     * @param time
     * @return
     */
    @RequestMapping("/generateOutStorAccount/")
    @ResponseBody
    public OutStorage generateOutStorAccount(String time){
        OutStorage outStorage = new OutStorage();
        String time1 = "ZBC"+time;
        OutStorage outStorage1 = outStorageService.getMaxOutStorAccount(time1);
        if(outStorage1==null){
            outStorage.setPurNumber(time1+"0001");
        }else{
            String enterOrder = outStorage1.getPurNumber().substring(outStorage1.getPurNumber().length()-4);
            int enterAccount = Integer.valueOf(enterOrder)+1;
            //如果不足4位前面补0
            String str = String.format("%04d", enterAccount);
            outStorage.setPurNumber(time1+str);
        }
        return outStorage;
    }

}
