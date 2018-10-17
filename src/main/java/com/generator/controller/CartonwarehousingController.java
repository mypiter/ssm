package com.generator.controller;


import com.generator.common.ResponseUtil;
import com.generator.common.UserUtil;
import com.generator.pojo.*;
import com.generator.service.CartonStockService;
import com.generator.service.CartonwarehousingService;
import com.generator.service.OutStorageService;
import com.generator.service.PlaceService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * 纸箱（成品）入库
 */
@RequestMapping("/Cartonwarehousing")
@Controller
public class CartonwarehousingController {
    @Resource
    private CartonwarehousingService cartonwarehousingService;
    @Resource
    private PlaceService placeService;
    @Resource
    private OutStorageService outStorageService;
    @Resource
    private CartonStockService cartonStockService;

    @RequestMapping("/addCW/")
    @ResponseBody
    public void addCW(HttpServletResponse response, String ph, String rkdate, String ck, String adminName, String table_data ){
        Msg msg=new Msg();
        //根据批号查询是否存在该记录
        
        Cartonwarehousing cartonwarehousing=new Cartonwarehousing();
        JSONArray jsonArray = JSONArray.fromObject(table_data);
//        System.out.println(jsonArray.getJSONObject(1).get("num"));
        Iterator<Object> it = jsonArray.iterator();

        while (it.hasNext()){
            JSONObject obj = (JSONObject) it.next();
            int n=Integer.parseInt(obj.get("number").toString());
            int b=Integer.parseInt(obj.get("baosun").toString());
            int nums=(Integer)obj.get("num");
            //根据订单号查询订单信息
            Place place=placeService.findById((String) obj.get("orderAccount"));
            //拿出订单开数，拿到出库数，计算出计划纸箱产量
            String op=place.getOpenNumber();
            //解析开数
            int a=Integer.parseInt(place.getOpenNumber());
            int ns=a*nums+(nums*10)/100;
           if(a*nums+(nums*10)/100<(n+b)){
               msg.setStatusCode("300");
               msg.setTitle("操作提示");
               msg.setMessage("入库失败!数量异常！");
               break;
           }else{
                   //如果入库数量与计划数量相等，则修改该记录的状态
                   OutStorage outStorage=outStorageService.selectById((Integer)obj.get("purId"));
                   if((outStorage.getCprk()+n+b)>a*nums+(nums*10)/100){
                       msg.setStatusCode("300");
                       msg.setTitle("操作提示");
                       msg.setMessage("入库数量不能大于计划成品数量的10%!");
                       break;
                   }else{
                       int m= outStorageService.updateOut((Integer)obj.get("purId"),n+b);

                       //根据当前纸箱入库数与计划纸箱产量比较，如果大于计划产量则不添加，否则添加
                       if(m>0){
                           cartonwarehousing.setRkPihao(ph);
                           cartonwarehousing.setRkTime(rkdate);
                           cartonwarehousing.setReservoir(ck);
                           cartonwarehousing.setRkName(adminName);
                           cartonwarehousing.setOrderAccount((String) obj.get("orderAccount"));
                           cartonwarehousing.setCustomName(place.getCustomName());
                           cartonwarehousing.setOrderNum(place.getOrderNum());
                           cartonwarehousing.setCartonHeight(place.getCartonHeight());
                           cartonwarehousing.setCartonLength(place.getCartonLength());
                           cartonwarehousing.setCartonPrice(place.getCartonPrice());
                           cartonwarehousing.setCartonWidth(place.getCartonWidth());
                           cartonwarehousing.setMaterialName((String) obj.get("materialScience"));
                           cartonwarehousing.setRkNum(nums);
                           cartonwarehousing.setFake(0);
                           cartonwarehousing.setPalletNumber(Integer.valueOf(obj.get("palletNumber").toString()));//托盘数
                           cartonwarehousing.setPitTypeName((String) obj.get("pitType"));
                           cartonwarehousing.setProductName(place.getCartonName());
                           cartonwarehousing.setStaffId(place.getStaffId());
                           cartonwarehousing.setNumber(n);
                           cartonwarehousing.setBaosun(b);
                           //数量验证，超过计划成品数量不进行录入
                           int num = cartonwarehousingService.addCh(cartonwarehousing);
                           if(num>0){
                               //这里进行成品仓库数量调整，如果不存在该记录则新增记录，存在的话直接修改数量即可
                               //根据订单号查询成品仓库中是否存在记录
                              CartonStock cartonStock=cartonStockService.selectById(cartonwarehousing.getOrderAccount());
                              if(cartonStock!=null){
                                  //直接修改库存数和托盘数
                                  int up=cartonStockService.updateById(cartonwarehousing.getOrderAccount(),cartonwarehousing.getNumber(),cartonwarehousing.getPalletNumber());
                                  if(up>0){
                                      msg.setStatusCode("200");
                                      msg.setTitle("操作提示");
                                      msg.setMessage("入库成功！");
                                  }else{
                                      msg.setStatusCode("300");
                                      msg.setTitle("操作提示");
                                      msg.setMessage("入库失败!");
                                  }
                              }else{
                                  //添加记录
                                  CartonStock carton=new CartonStock();
                                  carton.setFake(0);
                                  carton.setStockNum(cartonwarehousing.getNumber());
                                  carton.setOrderAccount(cartonwarehousing.getOrderAccount());
                                  carton.setMaterialScience(cartonwarehousing.getMaterialName());
                                  carton.setOrderNum(cartonwarehousing.getOrderNum());
                                  carton.setPalletNumber(cartonwarehousing.getPalletNumber());
                                  carton.setPitType(cartonwarehousing.getPitTypeName());
                                  carton.setPrice(cartonwarehousing.getCartonPrice());
                                  carton.setProductName(cartonwarehousing.getProductName());
                                  carton.setReservoir(cartonwarehousing.getReservoir());
                                  carton.setSize(place.getCartonLength()+"*"+place.getCartonWidth()+"*"+place.getCartonHeight());
                                  carton.setTotal(cartonwarehousing.getCartonPrice()*cartonwarehousing.getNumber());
                                  carton.setCustomerName(cartonwarehousing.getCustomName());
                                  int na=cartonStockService.addCS(carton);
                                  if(na>0){
                                      msg.setStatusCode("200");
                                      msg.setTitle("操作提示");
                                      msg.setMessage("入库成功！");
                                  }
                              }


                           }else{
                               msg.setStatusCode("300");
                               msg.setTitle("操作提示");
                               msg.setMessage("入库失败!");
                           }

                   }

                   }
               }
           }

        ResponseUtil.writeJson(response,msg);
    }
    @RequestMapping("/findAll/")
    @ResponseBody
    public pageBaen findAll(int page,int limit,String orderAccount){
        pageBaen pageBaen = new pageBaen();
        List<Cartonwarehousing> list = new ArrayList<Cartonwarehousing>();
        int cur = (page - 1) * limit;
        list=cartonwarehousingService.selectByRu(orderAccount);
        pageBaen.setCode(0);
        pageBaen.setCount(list.size());
        pageBaen.setData(list);
        pageBaen.setMsg("");
        return pageBaen;
    }
    @RequestMapping("/findA/")
    @ResponseBody
    public pageBaen findA(int page,int rows,String orderAccount) {
        pageBaen pageBaen = new pageBaen();
        List<Cartonwarehousing> list = new ArrayList<Cartonwarehousing>();
        list=cartonwarehousingService.selectByRu(orderAccount);
        pageBaen.setTotal(list.size());
        pageBaen.setRows(list);
        int total = list.size();
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
    /**
     * 批号生成
     * @return
     */
    @RequestMapping("/generateOrderAccount/")
    @ResponseBody
    public Cartonwarehousing generateOrderAccount(){
        Cartonwarehousing cartonwarehousing = new Cartonwarehousing();
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");//设置日期格式
        String time = "P"+df.format(new Date());
        //获取数据库中当天的最大的订单号
        Cartonwarehousing place1 = cartonwarehousingService.findByMaxAccount(time);
        if(place1==null){
            time+="0001";
            cartonwarehousing.setRkPihao(time);
        }else{
            String orderAccount = place1.getRkPihao();
            String orderAccounts = orderAccount.substring(orderAccount.length()-4);
            int orderAcc = (Integer.valueOf(orderAccounts)+1);
            //如果不足4位前面补0
            String str = String.format("%04d", orderAcc);
            cartonwarehousing.setRkPihao(time+str);
        }
        return cartonwarehousing;
    }
    /**
     * 跳转到入库标签页面
     * @param url
     * @param rkId
     * @return
     */
    @RequestMapping("/jumpLabel/")
    public ModelAndView jumpLabel(String url, String rkId){
        ModelAndView modelAndView  = new ModelAndView();
        String[] rk = rkId.split(",");
        List<Cartonwarehousing> listEnter = cartonwarehousingService.getListByPurId(UserUtil.StringToInt(rk));
        for (int i = 0; i < listEnter.size(); i++) {
            List<Cartonwarehousing> listEnters = new ArrayList<Cartonwarehousing>();
            Cartonwarehousing cartonwarehousing = listEnter.get(i);
            if (cartonwarehousing.getPalletNumber() > 0) {
                for (int j = 0; j < cartonwarehousing.getPalletNumber(); j++) {
                    listEnters.add(cartonwarehousing);
                }
            } else {
                listEnters.add(cartonwarehousing);
            }
            cartonwarehousing.setList(listEnters);
        }
        modelAndView.addObject("listEnter",listEnter);
        modelAndView.setViewName(url);
        return modelAndView;
    }

}
