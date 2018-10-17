package com.generator.controller;


import com.generator.common.ResponseUtil;
import com.generator.pojo.Msg;
import com.generator.pojo.PaperChange;
import com.generator.pojo.pageBaen;
import com.generator.service.PaperChangeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * 换纸
 */
@RequestMapping("/PaperChange")
@Controller
public class PaperChangeController {

    @Resource
    private PaperChangeService paperChangeService;
    @RequestMapping("/findById/")
    @ResponseBody
    public pageBaen findById(String puuid, int page, int rows){
        pageBaen pages = new pageBaen();
        int cur = (page-1)*rows;
        List<PaperChange>list=new ArrayList<PaperChange>();
        List<PaperChange>listAll=new ArrayList<PaperChange>();
        if(puuid==null){

        }else{
            list=paperChangeService.selectById(Integer.parseInt(puuid),cur,rows);
            listAll=paperChangeService.findAll(Integer.parseInt(puuid));
        }
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
    @RequestMapping("/addPaper/")
    @ResponseBody
    public void addPaper(HttpServletResponse response, boolean isNewRecord, int puuid, int type, String paperChangeS, String paperChangeE, double paperChangePrice){
        Msg msg=new Msg();
        if(type==2){
            msg.setStatusCode("300");
            msg.setTitle("操作提示");
            msg.setMessage("B类供应商无需添加换纸！");

        }else{
            PaperChange paperChange=new PaperChange();
            paperChange.setSupplierId(puuid);
            paperChange.setPaperChangeS(paperChangeS);
            paperChange.setPaperChangeE(paperChangeE);
            paperChange.setPaperChangePrice(paperChangePrice);
            paperChange.setFake(0);
            int num=paperChangeService.addPaper(paperChange);
            if(num>0){
                msg.setStatusCode("200");
                msg.setTitle("操作提示");
                msg.setMessage("添加成功！");
            }else{
                msg.setStatusCode("500");
                msg.setTitle("操作提示");
                msg.setMessage("添加失败！");
            }
        }
        ResponseUtil.writeJson(response,msg);
    }
    @RequestMapping("/updataPaper/")
    @ResponseBody
    public void updataPaper(HttpServletResponse response,PaperChange paperChange){
        Msg msg=new Msg();
        int num=paperChangeService.updatePaper(paperChange);
        if(num>0){
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
    @RequestMapping("/deletePaper/")
    @ResponseBody
    public void deletePaper(HttpServletResponse response,String id){
        Msg msg=new Msg();
        String sid=null;
        sid=id.replaceAll("'", "");//去除单引号0
        if(sid.indexOf(",") == -1){//是否包含，
            int num=paperChangeService.deleteYPaper(Integer.parseInt(sid));
            if(num>0){
                msg.setStatusCode("200");
                msg.setTitle("操作提示");
                msg.setMessage("删除成功！");
            }else{
                msg.setStatusCode("500");
                msg.setTitle("操作提示");
                msg.setMessage("删除失败！");
            }
        }else{
            //拆分，进行批量删除
        }
        ResponseUtil.writeJson(response,msg);
    }
}
