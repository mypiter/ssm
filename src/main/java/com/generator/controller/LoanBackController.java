package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.*;
import com.generator.service.FinancialRegistrationService;
import com.generator.service.LoanBackByReceiptRecordService;
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
 * 收款记录
 */
@RequestMapping("/LoanBack")
@Controller
public class LoanBackController {
    @Resource
    LoanBackByReceiptRecordService loanBackByReceiptRecordService;

    @Resource
    FinancialRegistrationService financialRegistrationService;

    @RequestMapping("/AddLoan/")
    @ResponseBody
    public void AddLoan(HttpServletResponse response,ReceiptRecord receiptRecord)throws IllegalStateException{
        Msg msg = new Msg();
        receiptRecord.setFlag(0);
        receiptRecord.setReceiptTime(new Date());
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");//这个是你要转成后的时间的格式
        receiptRecord.setReceiptAcceptanceTicket("CDPH"+sdf.format(receiptRecord.getReceiptAcceptanceDate()));   // 时间戳转换成时间
        int num = loanBackByReceiptRecordService.addLoan(receiptRecord);
        FinancialRegistration finan=new FinancialRegistration();
        finan.setFake(0);
        finan.setFinancePeople(receiptRecord.getCustomName());
        finan.setFinanceMoney(receiptRecord.getReceiptMoney());

        finan.setFinanceDate(receiptRecord.getReceiptAcceptanceDate());
        finan.setFinanceRegister(receiptRecord.getFinanceRegister());
        finan.setFinanceRemarks(receiptRecord.getReceiptRemarks());
        int mun=financialRegistrationService.addLoanTwo(finan);
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

    @RequestMapping("/LoanBackList/")
    @ResponseBody
    public pageBaen LoanBackList(int page, int rows, String sort, String order, String advanceFilter, String startTime, String endTime) {
        pageBaen pages = new pageBaen();//分页对象
        pageBaen pageBaen = new pageBaen();
        List<ComplexQuery> queryList = new ArrayList<ComplexQuery>();
        int cur = (page - 1) * rows;
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
        List<ReceiptRecord> list = loanBackByReceiptRecordService.select(cur, rows, sort, order, queryList, startTime, endTime);
        List<ReceiptRecord> listAll = loanBackByReceiptRecordService.selectAll(queryList, startTime, endTime);
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
    public ReceiptRecord findById(int receiptRecordId) {
        //返回前端的对象
        ReceiptRecord receiptRecord = new ReceiptRecord();
        receiptRecord = loanBackByReceiptRecordService.selectById(receiptRecordId);
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        receiptRecord.setFinanceDate(sdf.format(receiptRecord.getReceiptAcceptanceDate()));
        receiptRecord.setReceivableAdjustmentTotal(receiptRecord.getReceiptMoney());
//        ReceivableAdjustment receivableAdjustment=new ReceivableAdjustment();
//        receivableAdjustment.setReceivableAdjustmentTotal(receiptRecord.getReceiptMoney());
//        receivableAdjustment.setFinanceDate(sdf.format(receiptRecord.getReceiptAcceptanceDate()));
        return receiptRecord;
    }

    @RequestMapping("/edit/")
    @ResponseBody
    public ModelAndView jump(String url, int receiptRecordId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("receiptRecordId",receiptRecordId);
        modelAndView.setViewName(url);
        return modelAndView;
    }
}
