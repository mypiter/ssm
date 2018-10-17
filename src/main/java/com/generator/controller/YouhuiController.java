package com.generator.controller;


import com.generator.common.ResponseUtil;
import com.generator.pojo.Msg;
import com.generator.pojo.Youhui;
import com.generator.pojo.pageBaen;
import com.generator.service.YouhuiService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/Youhui")
@Controller
public class YouhuiController {
    @Resource
    private YouhuiService youhuiService;
    @RequestMapping("/findById/")
    @ResponseBody
    public pageBaen findById(String puuid, int page, int rows){
        pageBaen pages = new pageBaen();
        int cur = (page-1)*rows;
        List<Youhui>list=new ArrayList<Youhui>();
        List<Youhui>listAll=new ArrayList<Youhui>();
        if(puuid!=null){
            list=youhuiService.selectById(Integer.parseInt(puuid),cur,rows);
            list=youhuiService.findAll(Integer.parseInt(puuid));
        }
        //数据
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
    @RequestMapping("/addYouhui/")
    @ResponseBody
    public void addYouhui(HttpServletResponse response,boolean isNewRecord, int puuid, Youhui youhui){
            Msg msg=new Msg();

            youhui.setSupplierId(puuid);
            youhui.setFake(0);
            int num=youhuiService.addYouhui(youhui);
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
    @RequestMapping("/updataYouhui/")
    @ResponseBody
    public void updataYouhui(HttpServletResponse response,Youhui youhui){
        Msg msg=new Msg();
        int num=youhuiService.updateYouhui(youhui);
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
    @RequestMapping("/deleteYouhui/")
    @ResponseBody
    public void deleteYouhui(HttpServletResponse response,String id){
        Msg msg=new Msg();
        String sid=null;
        sid=id.replaceAll("'", "");//去除单引号0
        if(sid.indexOf(",") == -1){//是否包含，
            int num=youhuiService.deleteYouhui(Integer.parseInt(sid));
            if(num>0){
                msg.setStatusCode("200");
                msg.setTitle("操作提示");
                msg.setMessage("删除成功！");
            }else{
                msg.setStatusCode("500");
                msg.setTitle("操作提示");
                msg.setMessage("删除失败！");
            }
        }else {
            //拆分，进行批量删除
        }
        ResponseUtil.writeJson(response,msg);
    }
}
