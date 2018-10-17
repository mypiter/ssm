package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.*;
import com.generator.service.CartonOutInfoService;
import com.generator.service.CartonStockService;
import com.generator.service.CartonoutService;
import com.generator.service.PlaceService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import static com.generator.common.SystemException.unAbs;

/**
 * 纸箱出库（配送表）
 */
@RequestMapping("/Cartonout")
@Controller
public class CartonoutController {
    @Resource
    private CartonoutService cartonoutService;
    @Resource
    private CartonStockService cartonStockService;
    @Resource
    private CartonOutInfoService cartonOutInfoService;
    @Resource
    private PlaceService placeService;

    @RequestMapping("/AddCO/")
    @ResponseBody
    public void AddCO(HttpServletResponse response, String oder, String userNameId, String customCompary, String song, String car, String customName, String adminName, String customTel, String deliveryAddress, String cent,String deliveryStyle,String coid,double price, String table_data, String id){
        Msg msg=new Msg();
        CartonOutInfo lis=cartonOutInfoService.selectByDeliveryNumber(oder);
        if(lis==null){
        JSONArray jsonArray = JSONArray.fromObject(table_data);
        Iterator<Object> it = jsonArray.iterator();
        List<Cartonout> list=new ArrayList<Cartonout>();
        CartonOutInfo cartonOutInfo=new CartonOutInfo();
        //添加信息记录
        cartonOutInfo.setDeliTime(userNameId);//配送时间
        cartonOutInfo.setAllPrice(price);
        cartonOutInfo.setCar(car);
        cartonOutInfo.setConsignee(customName);
        cartonOutInfo.setConsigneeAddress(deliveryAddress);
        cartonOutInfo.setConsigneeContact(customTel);
        cartonOutInfo.setCustomCompany(customCompary);
        cartonOutInfo.setDeliName(song);
        cartonOutInfo.setDeliveryNumber(oder);
        cartonOutInfo.setFake(0);
        cartonOutInfo.setStart(1);
        cartonOutInfo.setMaker(adminName);
        cartonOutInfo.setRemarks(cent);
        cartonOutInfo.setDeliveryStyle(deliveryStyle);
        cartonOutInfo.setCoid(Integer.parseInt(coid));
        //查询是否存在该记录

        int nu=cartonOutInfoService.addCOI(cartonOutInfo);

        if(nu>0){
            while (it.hasNext()) {
                JSONObject obj = (JSONObject) it.next();
                //修改仓库该客户的库存数量
                String oa=(String) obj.get("orderAccount");
                int number=Integer.parseInt(obj.get("number").toString());
                int nb=unAbs(number);
                int num=cartonStockService.updateById(oa,nb,0);

                if(num>0){
                    //添加配送订单信息
                    Cartonout cartonout=new Cartonout();
                    double aprice=Double.valueOf(obj.get("price").toString());
                    cartonout.setCartonPrice(aprice);
                    cartonout.setConsigneeNum(0);
                    cartonout.setCustomCompany(customCompary);
                    cartonout.setDeliNum(0);
                    cartonout.setDeliveryNumber(oder);
                    cartonout.setFake(0);
                    cartonout.setIsconsignee("");
                    cartonout.setIsconsigneeNum(0);
                    cartonout.setMaterialName((String)obj.get("materialScience"));
                    cartonout.setMinorityNum(0);
                    cartonout.setOrderAccount((String)obj.get("orderAccount"));
                    cartonout.setOrderNum((Integer) obj.get("orderNum"));
                    cartonout.setOutNum(number);
                    cartonout.setOutTime(userNameId);
                    cartonout.setPalletNumber(0);
                    cartonout.setPitTypeName((String)obj.get("pitType"));
                    cartonout.setProductName((String)obj.get("productName"));
                    cartonout.setReservoir((String)obj.get("reservoir"));
                    cartonout.setReturnNum(0);
                    cartonout.setScrapNum(0);
                    cartonout.setSpecifications((String)obj.get("size"));//规格
                    cartonout.setAllPrice(aprice*number);
                    Place place=placeService.findById((String)obj.get("orderAccount"));//根据订单号查询业务员
                    if(place==null){
                        cartonout.setStaffId("null");
                    }else{
                        cartonout.setStaffId(place.getStaffId());
                    }
                    list.add(cartonout);
                }
            }
        }
            //批量添加
            int nums=cartonoutService.addCO(list);
            if (nums > 0) {
                msg.setStatusCode("250");
                msg.setTitle("操作提示");
                msg.setMessage(oder+"|"+deliveryStyle+"|"+coid);
            } else {
                msg.setStatusCode("500");
                msg.setTitle("操作提示");
                msg.setMessage("添加失败！");
            }
        }else{
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败！该记录已经存在！");
        }

        ResponseUtil.writeJson(response,msg);
 }
    @RequestMapping("/findAll/")
    @ResponseBody
    public pageBaen findAll(int page , int rows, String advanceFilter, String sort, String oder) {
        pageBaen pages = new pageBaen();//分页对象
        if (advanceFilter == null || sort == null || oder == null) {
            List<Cartonout> list = new ArrayList<Cartonout>();
            list = cartonoutService.selectAll();
            pages.setRows(list);
            int total = list.size();
            pages.setTotal(total);
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

        } else {
            //这里进行模糊查询

            //将查询条件封装成对象

        }
        return pages;
    }
    @RequestMapping("/getListByPid/")
    @ResponseBody
    public List<Cartonout> getListByPid(String deliveryNumber) {
        //返回前端的对象
        List<Cartonout> list =new ArrayList<Cartonout>();
        list=cartonoutService.selectByNum(deliveryNumber);
        if (list != null) {
            return list;
        } else {
            return null;
        }
    }
    @RequestMapping("/findByNum/")
    @ResponseBody
    public pageBaen findByNum(int page , int rows,String deliveryNumber) {
            pageBaen pages = new pageBaen();//分页对象
            List<Cartonout> list = new ArrayList<Cartonout>();
            list = cartonoutService.selectByD(deliveryNumber);
            pages.setRows(list);
            int total = list.size();
            pages.setTotal(total);
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
    @RequestMapping("/findByN/")
    @ResponseBody
    public pageBaen findByN(int page , int limit,String deliveryNumber) {
        pageBaen pages = new pageBaen();//分页对象
        List<Cartonout> list = new ArrayList<Cartonout>();
        int cur = (page - 1) * limit;
        list = cartonoutService.selectByNum(deliveryNumber);
        pages.setCode(0);
        pages.setCount(list.size());
        pages.setData(list);
        pages.setMsg("");
        return pages;
    }
    @RequestMapping("/findByTopjui/")
    @ResponseBody
    public pageBaen findByTopjui(int page , int rows,String orderAccount) {
        pageBaen pages = new pageBaen();//分页对象
        List<Cartonout> list = new ArrayList<Cartonout>();
        list = cartonoutService.selectByTopjui(orderAccount);
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
    @RequestMapping("/updateByNum/")
    @ResponseBody
    public void  updateByNum(HttpServletResponse response,String table_data){
        List<Cartonout> list=new ArrayList<Cartonout>();
        Msg msg=new Msg();
        Cartonout cartonout=new Cartonout();
        JSONArray jsonArray = JSONArray.fromObject(table_data);
        Iterator<Object> it = jsonArray.iterator();
        int num=0;
        int n=0;
        while (it.hasNext()) {
            JSONObject obj = (JSONObject) it.next();
            //添加配送订单信息
            cartonout.setId((Integer)obj.get("id"));
            cartonout.setConsigneeNum(Integer.parseInt(obj.get("consigneeNum").toString()));
            cartonout.setIsconsigneeNum((Integer) obj.get("isconsigneeNum"));
            cartonout.setIsconsignee((String)obj.get("isconsignee"));
            cartonout.setMinorityNum(Integer.parseInt(obj.get("minorityNum").toString()));
            cartonout.setReturnNum(Integer.parseInt(obj.get("returnNum").toString()));
            list.add(cartonout);
            num=cartonoutService.updateByD(list);
            if(num>0){
                n=cartonOutInfoService.updateByNum((String) obj.get("deliveryNumber"));

            }
        }
        if(n>0&&num>0){
            //修改配送信息状态，根据订单号修改
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("添加成功！");
        }else{
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败！");
        }
        ResponseUtil.writeJson(response,msg);
    }
}
