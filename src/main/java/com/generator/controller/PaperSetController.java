package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Msg;
import com.generator.pojo.PaperSetting;
import com.generator.pojo.pageBaen;
import com.generator.service.PaperSetService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 纸张设置
 */
@RequestMapping("/PaperSet")
@Controller
public class PaperSetController {
    @Resource
    PaperSetService paperSetService;
    @RequestMapping("/addPaper/")
    @ResponseBody
    public void addPaper(HttpServletResponse response,PaperSetting paperSetting) {
        Msg msg = new Msg();
        int num = paperSetService.addPaper(paperSetting);
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
    @RequestMapping("/select/")
    @ResponseBody
    public List<PaperSetting> select(){
        List<PaperSetting> list=new ArrayList<PaperSetting>();
        list=paperSetService.select();
        return list;
    }

    /**
     * 纸板入库报表查询所有的纸板入库记录
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @param advanceFilter
     * @return
     */
    @RequestMapping("/getPaper/")
    @ResponseBody
    public pageBaen getPaper(int page, int rows, String sort, String order, String advanceFilter){
        pageBaen pageBaen=new pageBaen();
        int cur = (page-1)*rows;
        List<ComplexQuery> queryList = new ArrayList<ComplexQuery>();
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
        List<PaperSetting> list = new ArrayList<PaperSetting>();
        List<PaperSetting> listAll = new ArrayList<PaperSetting>();
        list = paperSetService.findPaperList(cur,rows,sort,order,queryList);
        listAll = paperSetService.findPaperListAll(queryList);
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
    public ModelAndView jump(String url, int paperId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("paperId",paperId);
        modelAndView.setViewName(url);
        return modelAndView;
    }

    @RequestMapping("/findById/")
    @ResponseBody
    public PaperSetting findById(String url, int paperId){
        PaperSetting paper = new PaperSetting();
        paper = paperSetService.selectById(paperId);
        return paper;
    }

    /**
     * 修改纸张
     * @param response
     * @param paper
     * @throws IllegalStateException
     */
    @RequestMapping("/updatePaper/")
    @ResponseBody
    public void updatePaper(HttpServletResponse response, PaperSetting paper)throws IllegalStateException {
        Msg msg = new Msg();

        int num = paperSetService.updatePaper(paper);
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

    /**
     * 删除
     * @param response
     * @param paperId
     */
    @RequestMapping("/deletePaper/")
    @ResponseBody
    public void deletePaper(HttpServletResponse response,String paperId) {
        Msg msg = new Msg();
        String sid = null;
        sid = paperId.replaceAll("'", "");//去除单引号0
        int num =0;
        for(int i=0;i<sid.split(",").length;i++) {
            String id=sid.split(",")[i];
            num = paperSetService.deletePaper(Integer.parseInt(id));
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
}
