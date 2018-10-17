package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.*;
import com.generator.service.*;
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
import java.text.DecimalFormat;

@RequestMapping("/StaffTable")
@Controller
public class StaffTableController {
    @Resource
    private StaffTableService staffTableService;

    @RequestMapping("/findById/")
    @ResponseBody
    public StaffTable findById(int staffId) {
        //返回前端的对象
        StaffTable staffTable = new StaffTable();
        staffTable = staffTableService.selectById(staffId);
        if (staffTable != null) {
            return staffTable;
        } else {
            return null;
        }
    }

    @RequestMapping("/stafflist/")
    @ResponseBody
    public List<StaffTable> selectAll(int page, int rowssearch) {
        List<StaffTable> list = new ArrayList<StaffTable>();
        list = staffTableService.selectAll();
        return list;
    }

    @RequestMapping("/select/")
    @ResponseBody
    private pageBaen select(int page, int rows, String advanceFilter, String sort, String oder) {
        //判断是否为带条件查询
        pageBaen pages = new pageBaen();//分页对象
        List<ComplexQuery> queryList = new ArrayList<ComplexQuery>();
        int cur = (page-1)*rows;
        String sql = "and fake=0";
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
        List<StaffTable>list=staffTableService.selects(cur,rows,sort,oder,queryList);
        List<StaffTable>listAll=staffTableService.selectAlls(queryList);
            pages.setRows(list);
            int total = listAll.size();
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

    //员工下拉框查询
    @RequestMapping("/dropSelect/")
    @ResponseBody
    public pageBaen dropSelect(String page, String rows, String advanceFilter, String sort, String oder,String q){
        pageBaen pages = new pageBaen();
        //如果q不为空的话那就是客户下拉框进来的查询
        if(page==null && rows==null && advanceFilter==null && sort==null && oder==null ){//下拉搜索框进来的查询
            System.out.println("下拉框进来的查询");
            List<StaffTable> list = staffTableService.dropSelect(q);
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

    @RequestMapping("/addStaff/")
    @ResponseBody
    public void addStaff(HttpServletResponse response,StaffTable staffTable) {
        Msg msg = new Msg();
        staffTable.setFake(0);
        StaffTable sd=staffTableService.staffTableBystaffNumber();
        DecimalFormat df=new DecimalFormat("0000000000");
        String str2="";
        if(sd!=null){
            str2=df.format(sd.getStaffId());
            staffTable.setStaffNumber(str2);
        }else{
            staffTable.setStaffNumber("0000000000");
        }
        int num = staffTableService.addstaffTable(staffTable);
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

    @RequestMapping("/updataStaff/")
    @ResponseBody
    public void updataStaff(HttpServletResponse response,StaffTable staffTabl) {
        Msg msg = new Msg();
        int num = staffTableService.updateStaff(staffTabl);
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

    @RequestMapping("/deleteStaff/")
    @ResponseBody
    public void deleteStaff(HttpServletResponse response,String staffId) {
        Msg msg = new Msg();
        String sid = null;
        sid = staffId.replaceAll("'", "");//去除单引号0
        int num =0;
        for(int i=0;i<sid.split(",").length;i++) {
            String id=sid.split(",")[i];
            num = staffTableService.deleteStaff(Integer.parseInt(id));
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

    //业务员下拉框查询
    @RequestMapping("/findByBusiness/")
    @ResponseBody
    public pageBaen findByBusiness(String q,int type){
        pageBaen pages = new pageBaen();
        List<StaffTable> list = staffTableService.findByBusiness(q,type);
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
}
