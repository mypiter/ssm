package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Msg;
import com.generator.pojo.Rejected;
import com.generator.pojo.pageBaen;
import com.generator.service.RejectedService;
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
 * 成品退货赔款
 */
@RequestMapping("/RejectedController")
@Controller
public class RejectedController {
    @Resource
    RejectedService rejectedService;

    @RequestMapping("/addRejected/")
    @ResponseBody
    public void addRejected(HttpServletResponse response,Rejected rejected) {
        Msg msg = new Msg();
        rejected.setFake(0);
        int num = rejectedService.addRejected(rejected);
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

    @RequestMapping("/RejectedList/")
    @ResponseBody
    private pageBaen RejectedList(int page, int rows, String advanceFilter, String sort, String oder){
        //判断是否为带条件查询
        pageBaen pages=new pageBaen();//分页对象
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
        List<Rejected>list=rejectedService.select(cur,rows,sort,oder,queryList);
        List<Rejected>listAll=rejectedService.selectAll(queryList);
        pages.setRows(list);
        int total=listAll.size();
        pages.setTotal(total);
        int totalPage=total%rows==0?(total/rows):(total/rows)+1;//总页数
        pages.setTotalPage(totalPage);
        pages.setCurrentPage(page);
        pages.setNumPerPage(rows);
        pages.setNextPage(totalPage-page==0?page:page+1);
        pages.setPreviousPage(page-0==1?page:page-1);
        pages.setHasPreviousPage(true);
        pages.setHasNextPage(true);
        pages.setFirstPage(true);
        pages.setLastPage(true);

        return pages;
    }

    @RequestMapping("/edit/")
    public ModelAndView jump(String url, int rejectedId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("rejectedId",rejectedId);
        modelAndView.setViewName(url);
        return modelAndView;
    }

    @RequestMapping("/deleteRejected/")
    @ResponseBody
    public void deleteRejected(HttpServletResponse response,String rejectedId) {
        Msg msg = new Msg();
        String sid = null;
        sid = rejectedId.replaceAll("'", "");//去除单引号0
        int num =0;
        for(int i=0;i<sid.split(",").length;i++) {
            String id=sid.split(",")[i];
            num = rejectedService.deleteRejected(Integer.parseInt(id));
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

    @RequestMapping("/findById/")
    @ResponseBody
    public Rejected findById(int rejectedId) {
        //返回前端的对象
        Rejected rejected = new Rejected();
        rejected = rejectedService.selectById(rejectedId);
        return rejected;
    }

    @RequestMapping("/updataRejected/")
    @ResponseBody
    public void updataRejected(HttpServletResponse response,Rejected rejected) {
        Msg msg = new Msg();
        int num = rejectedService.updateRejected(rejected);
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
}
