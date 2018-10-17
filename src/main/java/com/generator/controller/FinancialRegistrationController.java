package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.*;
import com.generator.service.FinancialRegistrationService;
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

/**
 * 财务登记
 */
@RequestMapping("/FinancialRegistration")
@Controller
public class FinancialRegistrationController {
    @Resource
    FinancialRegistrationService financialRegistrationService;

    @RequestMapping("/FinancialList/")
    @ResponseBody
    public pageBaen FinancialList(int page, int rows, String sort, String order, String advanceFilter, String startTime, String endTime) {
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
        List<FinancialRegistration> list = financialRegistrationService.select(cur, rows, sort, order, queryList, startTime, endTime);
        List<FinancialRegistration> listAll = financialRegistrationService.selectAll(queryList, startTime, endTime);
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

    @RequestMapping("/AddFinancial/")
    @ResponseBody
    public void AddFinancial(HttpServletResponse response,FinancialRegistration financialRegistration){
        Msg msg = new Msg();
        financialRegistration.setFake(0);
        int num = financialRegistrationService.addFinancial(financialRegistration);
        if (num > 0) {
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("添加成功！");
        } else {
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败！");
        }
        ResponseUtil.writeJson(response,msg);
    }

    @RequestMapping("/edit/")
    public ModelAndView jump(String url, int financialRegistrationId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("financialRegistrationId",financialRegistrationId);
        modelAndView.setViewName(url);
        return modelAndView;
    }

    @RequestMapping("/deleteFinancial/")
    @ResponseBody
    public void deleteFinancial(HttpServletResponse response,String financialRegistrationId) {
        Msg msg = new Msg();
        String sid = null;
        sid = financialRegistrationId.replaceAll("'", "");//去除单引号0
        int num =0;
        for(int i=0;i<sid.split(",").length;i++) {
            String id=sid.split(",")[i];
            num = financialRegistrationService.deleteFinancial(Integer.parseInt(id));
            if (num ==0) {
                msg.setStatusCode("500");
                msg.setTitle("操作提示");
                msg.setMessage("删除失败！");
                continue;
            }
        }
        if (num >0) {
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("删除成功！");
        }
        ResponseUtil.writeJson(response,msg);
    }

    @RequestMapping("/updataFinancial/")
    @ResponseBody
    public void updataFinancial(HttpServletResponse response,FinancialRegistration financialRegistration) {
        Msg msg = new Msg();
        int num = financialRegistrationService.updateFinancial(financialRegistration);
        if (num > 0) {
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("修改成功！");
        } else {
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("修改失败！");
        }
        ResponseUtil.writeJson(response,msg);
    }

    @RequestMapping("/findById/")
    @ResponseBody
    public FinancialRegistration findById(int financialRegistrationId) {
        //返回前端的对象
        FinancialRegistration financialRegistration = new FinancialRegistration();
        financialRegistration = financialRegistrationService.findById(financialRegistrationId);
        return financialRegistration;
    }
}
