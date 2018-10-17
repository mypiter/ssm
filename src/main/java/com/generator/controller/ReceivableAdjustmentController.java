package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.*;
import com.generator.service.LoanBackByReceiptRecordService;
import com.generator.service.PayLoadService;
import com.generator.service.ReceivableAdjustmentService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@RequestMapping("/ReceivableAdjustmentController")
@Controller
public class ReceivableAdjustmentController {

    @Resource
    private ReceivableAdjustmentService receivableAdjustmentService;

    @Resource
    private LoanBackByReceiptRecordService loanBackByReceiptRecordService;

    @Resource
    private PayLoadService payLoadService;

    @RequestMapping("/AddReceivable/")
    @ResponseBody
    public void addReceivable(HttpServletResponse response,ReceivableAdjustment receivableAdjustment){
        Msg msg = new Msg();
        if(receivableAdjustment.getReceiptRecordId()>0) {
            ReceiptRecord receiptRecord = new ReceiptRecord();
            receiptRecord.setReceiptRecordId(receivableAdjustment.getReceiptRecordId());
            if(receivableAdjustment.getReceivableAdjustmentAfterTotal()!=null)
            receiptRecord.setReceiptMoney(receivableAdjustment.getReceivableAdjustmentAfterTotal());
            if(receivableAdjustment.getReceivableAdjustmentDate()!=null)
            receiptRecord.setReceiptAcceptanceDate(receivableAdjustment.getReceivableAdjustmentDate());
            loanBackByReceiptRecordService.updateLoan(receiptRecord);
        }
        if(receivableAdjustment.getPaymentRecordId()>0){
            PaymenttRecord paymenttrecord=new PaymenttRecord();
            paymenttrecord.setPaymentRecordId(receivableAdjustment.getPaymentRecordId());
            if(receivableAdjustment.getReceivableAdjustmentAfterTotal()!=null)
                paymenttrecord.setPaymentMoney(receivableAdjustment.getReceivableAdjustmentAfterTotal());
            if(receivableAdjustment.getReceivableAdjustmentDate()!=null)
                paymenttrecord.setPaymentAcceptanceDate(receivableAdjustment.getReceivableAdjustmentDate());
            payLoadService.updatePay(paymenttrecord);
        }
        /*if(receivableAdjustment.getFinanceDate()!=null){
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date1 = null;
            try {
                date1 = sdf.parse(receivableAdjustment.getFinanceDate());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            receivableAdjustment.setReceivableAdjustmentDate(date1);
        }*/
        int mun=receivableAdjustmentService.addReceivable(receivableAdjustment);
        if (mun > 0) {
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

    @RequestMapping("/loadReceivableList/")
    @ResponseBody
    public pageBaen loadReceivableList(int page, int rows, String sort, String order, String advanceFilter){
        pageBaen pageBaen = new pageBaen();
        List<ComplexQuery> queryList = new ArrayList<ComplexQuery>();
        int cur = (page-1)*rows;
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
        List<ReceivableAdjustment> list = receivableAdjustmentService.loadReceivableList(cur,rows,sort,order,queryList);
        List<ReceivableAdjustment> listAll = receivableAdjustmentService.loadReceivableListAll(queryList);
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

    @RequestMapping("/edit/")
    public ModelAndView jump(String url, int paymentRecordId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("paymentRecordId",paymentRecordId);
        modelAndView.setViewName(url);
        return modelAndView;
    }
}
