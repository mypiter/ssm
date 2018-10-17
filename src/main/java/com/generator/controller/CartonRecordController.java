package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.CartonRecord;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Msg;
import com.generator.pojo.pageBaen;
import com.generator.service.CartonRecordService;
import com.generator.service.CartonStockService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@RequestMapping("/CartonRecord")
@Controller
public class CartonRecordController {

    @Resource
    private CartonRecordService cartonRecordService;
    @Resource
    private CartonStockService cartonStockService;

    @RequestMapping("/addCartonRecord/")
    @ResponseBody
    public void addCartonRecord(HttpServletResponse response,String rkdate, String ck, String adminName, String table_data){
        //返回前端的操作提示
        Msg msg=new Msg();
        JSONArray jsonArray = JSONArray.fromObject(table_data);
        Iterator<Object> it = jsonArray.iterator();
        while (it.hasNext()) {
            JSONObject obj = (JSONObject) it.next();
            //修改库存
            //新的库存
            int k=Integer.valueOf(obj.get("number").toString());
            int c=Integer.valueOf(obj.get("orderNum").toString());
            int kc=k+c;
            int tp=Integer.valueOf(obj.get("tp").toString());
            int num=cartonStockService.updateById((String) obj.get("orderAccount"),k,tp);
            if(num>0){
                //添加记录
                CartonRecord cartonRecord=new CartonRecord();
                cartonRecord.setCardboardTime(rkdate);
                cartonRecord.setCartonNewNum(kc);
                cartonRecord.setCartonNum((Integer) obj.get("orderNum"));
                cartonRecord.setCartonType("0");
                cartonRecord.setCustomer((String) obj.get("customerName"));
                cartonRecord.setFake(0);
                cartonRecord.setOperator(adminName);
                cartonRecord.setOrderNumber((String) obj.get("orderAccount"));
                cartonRecord.setProductName((String) obj.get("productName"));
                cartonRecord.setRemark((String) obj.get("cent"));
                cartonRecord.setReservoirArea(ck);
                int nums = cartonRecordService.addCR(cartonRecord);
                if (nums > 0) {
                    msg.setStatusCode("200");
                    msg.setTitle("操作提示");
                    msg.setMessage("添加成功！");
                } else {
                    msg.setStatusCode("500");
                    msg.setTitle("操作提示");
                    msg.setMessage("添加失败！");
                }
            }

        }
        ResponseUtil.writeJson(response,msg);
    }
    @RequestMapping("/findRecod/")
    @ResponseBody
    public pageBaen findRecod(int page,int rows,String sort,String order,String advanceFilter,String startTime,String endTime) {
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
        List<CartonRecord> list = cartonRecordService.selectAl(cur, rows, sort, order, queryList, startTime, endTime);
        List<CartonRecord> listAll = cartonRecordService.selectAll(queryList, startTime, endTime);
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

    /**
     * 跳转到并填充数据到成品库存调整详情页面
     * @param url
     * @param orderNumber
     * @return
     */
    @RequestMapping("/jumpCarton/")
    public ModelAndView jumpCarton(String url, String orderNumber){
        ModelAndView modelAndView = new ModelAndView();
        CartonRecord cartonRecord = cartonRecordService.findById(orderNumber);
        modelAndView.addObject("cartonRecord",cartonRecord);
        modelAndView.setViewName(url);
        return modelAndView;
    }
}
