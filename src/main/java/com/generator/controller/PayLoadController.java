package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.*;
import com.generator.service.CartonSupplierService;
import com.generator.service.FinancialRegistrationService;
import com.generator.service.PayLoadService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * 付款记录
 */
@RequestMapping("/PayLoad")
@Controller
public class PayLoadController {
    @Resource
    CartonSupplierService cartonSupplierService;

    @Resource
    PayLoadService payLoadService;

    @Resource
    FinancialRegistrationService financialRegistrationService;

    @RequestMapping("/select/")
    @ResponseBody
    public pageBaen dropSelect(String page, String rows, String advanceFilter, String sort, String oder, String q){
        pageBaen pages = new pageBaen();
        //如果q不为空的话那就是客户下拉框进来的查询
        if(page==null && rows==null && advanceFilter==null && sort==null && oder==null ){//下拉搜索框进来的查询
            System.out.println("下拉框进来的查询");
            List<CartonSupplier> list = cartonSupplierService.dropSelect(q);
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

    @RequestMapping("/AddPay/")
    @ResponseBody
    public void AddPay(HttpServletResponse response,PaymenttRecord paymenttRecord, HttpServletRequest request, Model model) throws IllegalStateException, IOException {
        Msg msg = new Msg();
        paymenttRecord.setFlag(0);
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");//这个是你要转成后的时间的格式
        paymenttRecord.setPaymentAcceptanceTicket("CDPH"+sdf.format(paymenttRecord.getPaymentAcceptanceDate()));// 时间戳转换成承兑票号
        paymenttRecord.setPaymentTime(new Date());
        int num = payLoadService.addPay(paymenttRecord);
        FinancialRegistration finan=new FinancialRegistration();
        finan.setFake(0);
        finan.setFinancePeople(paymenttRecord.getSupplierName());
        finan.setFinanceMoney(paymenttRecord.getPaymentMoney());
        finan.setFinanceDate(paymenttRecord.getPaymentAcceptanceDate());
        finan.setFinanceRegister(paymenttRecord.getFinanceRegister());
        finan.setFinanceRemarks(paymenttRecord.getPaymentRemarks());
        int mun=financialRegistrationService.addPay(finan);
        if (num > 0 && mun > 0) {
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

    @RequestMapping("/PayLoadList/")
    @ResponseBody
    public pageBaen PayLoadList(int page, int rows, String sort, String order, String advanceFilter, String startTime, String endTime) {
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
        List<PaymenttRecord> list = payLoadService.select(cur, rows, sort, order, queryList, startTime, endTime);
        List<PaymenttRecord> listAll = payLoadService.selectAll(queryList, startTime, endTime);
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

    @RequestMapping("/findById/")
    @ResponseBody
    public PaymenttRecord findById(int paymentRecordId) {
        //返回前端的对象
        PaymenttRecord paymenttRecord = new PaymenttRecord();
        paymenttRecord = payLoadService.selectById(paymentRecordId);
        paymenttRecord.setCartonName(paymenttRecord.getSupplierName());
        paymenttRecord.setReceivableAdjustmentTotal(paymenttRecord.getPaymentMoney());
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        paymenttRecord.setFinanceDate(sdf.format(paymenttRecord.getPaymentAcceptanceDate()));
        return paymenttRecord;
    }
}
