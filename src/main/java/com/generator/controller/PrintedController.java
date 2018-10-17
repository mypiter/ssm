package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Msg;
import com.generator.pojo.Printed;
import com.generator.pojo.pageBaen;
import com.generator.service.PrintedService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * 印版登记
 */
@RequestMapping("/PrintedController")
@Controller
public class PrintedController {
    @Resource
    PrintedService printedService;

    @RequestMapping("/PrintedSelect/")
    @ResponseBody
    public pageBaen dropSelect(String page, String rows, String advanceFilter, String sort, String oder, String q){
        pageBaen pages = new pageBaen();
        //如果q不为空的话那就是客户下拉框进来的查询
        if(page==null && rows==null && advanceFilter==null && sort==null && oder==null ){//下拉搜索框进来的查询
            System.out.println("下拉框进来的查询");
            List<Printed> list = printedService.dropSelect(q);
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

    @RequestMapping("/addPrinted/")
    @ResponseBody
    public void addPrinted(HttpServletResponse response,Printed printed, HttpServletRequest request) throws IllegalStateException, IOException {
        Msg msg = new Msg();
        printed.setFake(0);

        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        //保存数据库的路径
        String sqlPath = "";
        //定义文件保存的本地路径
        //String localPath=request.getSession().getServletContext().getRealPath("/")+"uploads/printed/";
        String localPath="/opt/Print/";
        //定义 文件名
        String filename=null;
        File folder = new File(localPath);
        //文件夹路径不存在
        if (!folder.exists() && !folder.isDirectory()) {
            folder.mkdirs();
        }
        if(!printed.getPrintPictureFile().isEmpty()){
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType=printed.getPrintPictureFile().getContentType();
            //获得文件后缀名
            String suffixName=contentType.substring(contentType.indexOf("/")+1);
            //得到 文件名
            filename=sdf.format(date)+"."+suffixName;
            System.out.println(filename);
            //文件保存路径
            printed.getPrintPictureFile().transferTo(new File(localPath+filename));
        }
        //把图片的相对路径保存至数据库
        sqlPath = "/opt/Print/"+filename;
        if(filename!=null)
        printed.setPrintPicture(sqlPath);

        int num = printedService.addPrinted(printed);
        if (num > 0) {
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage(sqlPath);
        } else {
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败！");
        }
        ResponseUtil.writeJson(response,msg);
    }

    @RequestMapping("/PrintedList/")
    @ResponseBody
    private pageBaen PrintedList(int page, int rows, String advanceFilter, String sort, String oder){
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
        List<Printed>list=printedService.select(cur,rows,sort,oder,queryList);
        List<Printed>listAll=printedService.selectAll(queryList);
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
    public ModelAndView jump(String url, int printedId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("printedId",printedId);
        modelAndView.setViewName(url);
        return modelAndView;
    }

    @RequestMapping("/deletePrinted/")
    @ResponseBody
    public void deletePrinted(HttpServletResponse response,String printedId) {
        Msg msg = new Msg();
        String sid = null;
        sid = printedId.replaceAll("'", "");//去除单引号0
        //拆分，进行批量删除
        int num =0;
        for(int i=0;i<sid.split(",").length;i++) {
            String id=sid.split(",")[i];
            num =  printedService.deletePrinted(Integer.parseInt(id));
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

    @RequestMapping("/updataPrinted/")
    @ResponseBody
    public void updataPrinted(HttpServletResponse response,Printed printed,HttpServletRequest request)throws IllegalStateException, IOException{
        Msg msg = new Msg();
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        //保存数据库的路径
        String sqlPath = "";
        //定义文件保存的本地路径
        String localPath=request.getSession().getServletContext().getRealPath("/")+"uploads/printed/";
        //定义 文件名
        String filename=null;
        File folder = new File(localPath);
        //文件夹路径不存在
        if (!folder.exists() && !folder.isDirectory()) {
            folder.mkdirs();
        }
        if(!printed.getPrintPictureFile().isEmpty()){
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType=printed.getPrintPictureFile().getContentType();
            //获得文件后缀名
            String suffixName=contentType.substring(contentType.indexOf("/")+1);
            //得到 文件名
            filename=sdf.format(date)+"."+suffixName;
            System.out.println(filename);
            //文件保存路径
            printed.getPrintPictureFile().transferTo(new File(localPath+filename));
        }
        //把图片的相对路径保存至数据库
        sqlPath = "/uploads/printed/"+filename;
        if(filename!=null)
            printed.setPrintPicture(sqlPath);
        int num = printedService.updatePrinted(printed);
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

    @RequestMapping("/findById/")
    @ResponseBody
    public Printed findById(int printedId) {
        //返回前端的对象
        Printed printed = new Printed();
        printed = printedService.selectById(printedId);
        return printed;
    }
}
