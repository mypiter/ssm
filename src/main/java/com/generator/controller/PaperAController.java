package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.Msg;
import com.generator.pojo.PaperA;
import com.generator.pojo.pageBaen;
import com.generator.service.PaperAService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/PaperA")
@Controller
public class PaperAController {
    private static final Logger LOG = LoggerFactory.getLogger(PaperAController.class);
    @Resource
    private PaperAService paperAService;
    @RequestMapping("/findById/")
    @ResponseBody
    public pageBaen findById(String puuid, int page, int rows){
        pageBaen pages = new pageBaen();
        int cur = (page-1)*rows;
        List<PaperA>list=new ArrayList<PaperA>();
        List<PaperA>listAll=new ArrayList<PaperA>();
        if(puuid==null){

        }else{
            list=paperAService.selectById(Integer.parseInt(puuid),cur,rows);
            listAll=paperAService.findAll(Integer.parseInt(puuid));
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
    @RequestMapping("/addPaperA/")
    @ResponseBody
    public void addPaperA(HttpServletResponse response,boolean isNewRecord, int type, int puuid, String texture, String myTexture, int weight, String paperType){
        Msg msg=new Msg();
        PaperA paperA=new PaperA();
        if(type==2){
            msg.setStatusCode("300");
            msg.setTitle("操作提示");
            msg.setMessage("B类型供应商只能在B类材质中登记！");

        }else{
            //设置插入参数
            paperA.setSupllierId(puuid);
            paperA.setTexture(texture);
            paperA.setMyTexture(myTexture);
            paperA.setWeight(weight);
            paperA.setPaperType(paperType);
            int num=paperAService.addPaperA(paperA);
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
    @RequestMapping("/findMyCodeByCode/")
    @ResponseBody
    public String findMyCodeByCode(int supllierId,String str){
        String strCode = paperAService.selectMyCodeByCo(supllierId,str);
        System.out.println(strCode);
        return strCode;
    }
    @RequestMapping("/updataPaperA/")
    @ResponseBody
    public void updataPaperA(HttpServletResponse response,PaperA paperA){
        Msg msg=new Msg();
        int num=paperAService.updatePaperA(paperA);
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
    @RequestMapping("/deletePaperA/")
    @ResponseBody
    public void deletePaperA(HttpServletResponse response,String id){
        Msg msg=new Msg();
        String sid=null;
        sid=id.replaceAll("'", "");//去除单引号0
        if(sid.indexOf(",") == -1){//是否包含，
            int num=paperAService.deletePaperA(Integer.parseInt(sid));
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
