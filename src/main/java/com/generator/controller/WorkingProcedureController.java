package com.generator.controller;


import com.generator.common.ResponseUtil;
import com.generator.pojo.Msg;
import com.generator.pojo.WorkingProcedure;
import com.generator.pojo.pageBaen;
import com.generator.service.WorkingProcedureService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/WorkingProcedure")
@Controller
public class WorkingProcedureController {
    @Resource
    private WorkingProcedureService workingProcedureService;

    @RequestMapping("/addWP/")
    public void addWP(HttpServletResponse response,WorkingProcedure workingProcedure){
        Msg msg=new Msg();
        int num=workingProcedureService.addWP(workingProcedure);
        if(num>0){
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
    @RequestMapping("/findeById/")
    @ResponseBody
    public WorkingProcedure findeById(int id){
        WorkingProcedure workingProcedure=workingProcedureService.selectById(id);
        return workingProcedure;
    }
    @RequestMapping("/updateWP/")
    public void updateWP(HttpServletResponse response,WorkingProcedure workingProcedure){
        Msg msg=new Msg();
        int num=workingProcedureService.updateWP(workingProcedure);
        if(num>0){
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("更新成功！");
        }else{
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("更新失败！");
        }
        ResponseUtil.writeJson(response,msg);
    }
    @RequestMapping("/getList/")
    @ResponseBody
    public pageBaen getList(){
        List<WorkingProcedure> list=new ArrayList<WorkingProcedure>();
        list=workingProcedureService.select();
        pageBaen pages = new pageBaen();
        //如果q不为空的话那就是客户下拉框进来的查询
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

    @RequestMapping("/finds/")
    @ResponseBody
    public List<WorkingProcedure> finds(String newValue){
        String[] strArr = newValue.split("");
        List<WorkingProcedure> list=new ArrayList<WorkingProcedure>();
        List<WorkingProcedure> listw=new ArrayList<WorkingProcedure>();
        list=workingProcedureService.selectByco(strArr);
        //根据数组排序
        for(int i=0;i<strArr.length;i++){
            for (int j=0;j<list.size();j++){
                if(strArr[i].equals(list.get(j).getCode())){
                    listw.add(list.get(j));
                }
            }
        }
        return listw;
    }
    @RequestMapping("/delect/")
    @ResponseBody
    public void delect(HttpServletResponse response,String id){
        Msg msg=new Msg();
        int num;
        //处理前端传入的id
        if (id.indexOf(",") == -1) {//判断是否包含
            //处理id
            String ids=id.replaceAll("'", "");//去除单引号0
            num= workingProcedureService.deleteWP(Integer.parseInt(ids));
            if (num > 0) {
                msg.setStatusCode("200");
                msg.setTitle("操作提示");
                msg.setMessage("删除成功！");
            } else {
                msg.setStatusCode("500");
                msg.setTitle("操作提示");
                msg.setMessage("删除失败！");
            }
        }else{
            msg.setStatusCode("300");
            msg.setTitle("操作提示");
            msg.setMessage("该模块无法批量删除！");
        }
        ResponseUtil.writeJson(response,msg);
    }

}
