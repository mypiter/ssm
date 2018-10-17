package com.generator.controller;


import com.generator.common.ResponseUtil;
import com.generator.pojo.CartonOutInfo;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Msg;
import com.generator.pojo.pageBaen;
import com.generator.service.CartonOutInfoService;
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
 * 配送信息
 */
@RequestMapping("/CartonOutInfo")
@Controller
public class CartonOutInfoController {
    @Resource
    private CartonOutInfoService cartonOutInfoService;

    @RequestMapping("/findAll/")
    @ResponseBody
    public pageBaen findAll(int page,int rows,String sort,String order,String advanceFilter,String bSecondedCustomerString ,String startTime,String endTime) {
        pageBaen pages = new pageBaen();//分页对象
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
        List<CartonOutInfo> list = cartonOutInfoService.selectA(cur, rows, sort, order, queryList, startTime, endTime);
        List<CartonOutInfo> listAll = cartonOutInfoService.selectAl(queryList,bSecondedCustomerString,startTime, endTime);
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
    @RequestMapping("/findByQ/")
    @ResponseBody
    public pageBaen findByQ(String q) {
        pageBaen pages = new pageBaen();//分页对象
            List<CartonOutInfo> list = new ArrayList<CartonOutInfo>();
            list = cartonOutInfoService.selectAll();
            pages.setRows(list);
        return pages;
    }

    //客户查询
    @RequestMapping("/select/")
    @ResponseBody
    public pageBaen selects(String page, String rows, String advanceFilter, String sort, String oder,String q){
        pageBaen pages = new pageBaen();
        //如果q不为空的话那就是客户下拉框进来的查询
        if(page==null && rows==null && advanceFilter==null && sort==null && oder==null ){//下拉搜索框进来的查询
            System.out.println("下拉框进来的查询");
            List<CartonOutInfo> list = cartonOutInfoService.selects(q);
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
        }
        return pages;
    }

    @RequestMapping("/getListByPid/")
    @ResponseBody
    public List<CartonOutInfo> getListByPid(String customName) {
//        pageBaen pages = new pageBaen();
        //返回前端的对象
        List<CartonOutInfo> list=new ArrayList<CartonOutInfo>();
        if(customName!=""&&customName!=null)
        list = cartonOutInfoService.getListByPid(customName);
//        pages.setRows(list);
        if (list != null) {
            return list;
        } else {
            return null;
        }
    }

    @RequestMapping("/getList/")
    @ResponseBody
    public List<CartonOutInfo> getList() {
        //返回前端的对象
        List<CartonOutInfo> list=new ArrayList<CartonOutInfo>();
        list = cartonOutInfoService.getList();
        if (list != null) {
            return list;
        } else {
            return null;
        }
    }

    /**
     * 跳转到并填充数据到配送详情页面
     * @param url
     * @param deliveryNumber
     * @return
     */
    @RequestMapping("/jumpCartonInfo/")
    public ModelAndView jumpCartonInfo(String url, String deliveryNumber){
        ModelAndView modelAndView = new ModelAndView();
        CartonOutInfo cartonOutInfo = cartonOutInfoService.findById(deliveryNumber);
        modelAndView.addObject("cartonOutInfo",cartonOutInfo);
        modelAndView.setViewName(url);
        return modelAndView;
    }
    @RequestMapping("/Eidt/")
    public ModelAndView Eidt(String url, String uuid){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("uuid",uuid);
        modelAndView.setViewName(url);
        return modelAndView;
    }

    /**
     * 送货单号生成
     * @return
     */
    @RequestMapping("/generateOrderAccount/")
    @ResponseBody
    public CartonOutInfo generateOrderAccount(){
        CartonOutInfo cartonOutInfo = new CartonOutInfo();
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");//设置日期格式
        String time = "S"+df.format(new Date());
        //获取数据库中当天的最大的订单号
        CartonOutInfo place1 = cartonOutInfoService.findByMaxAccount(time);
        if(place1==null){
            time+="0001";
            cartonOutInfo.setDeliveryNumber(time);
        }else{
            String orderAccount = place1.getDeliveryNumber();
            String orderAccounts = orderAccount.substring(orderAccount.length()-4);
            int orderAcc = (Integer.valueOf(orderAccounts)+1);
            //如果不足4位前面补0
            String str = String.format("%04d", orderAcc);
            cartonOutInfo.setDeliveryNumber(time+str);
        }
        return cartonOutInfo;
    }
    @RequestMapping("/updateByNum/")
    @ResponseBody
    public void  updateByNum(HttpServletResponse response, String cartonoutId,String deliveryStyle){
        Msg msg=new Msg();
              int n=cartonOutInfoService.updateByid(Integer.parseInt(cartonoutId),deliveryStyle);
        if(n>0){
            //修改配送信息状态，根据订单号修改
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("修改成功！");
        }else{
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("修改失败！");
        }
        ResponseUtil.writeJson(response,msg);
    }
}
