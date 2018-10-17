package com.generator.controller;


import com.generator.common.ResponseUtil;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Duizhang;
import com.generator.pojo.Msg;
import com.generator.pojo.pageBaen;
import com.generator.service.DuizhangService;
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

@RequestMapping("/Duizhang")
@Controller
public class DuizhangController {
    @Resource
    private DuizhangService duizhangService;
    @RequestMapping("/addDz/")
    @ResponseBody
    public void addDz(HttpServletResponse response, Duizhang duizhang, HttpServletRequest request)throws IllegalStateException, IOException {
        Msg msg = new Msg();
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        //保存数据库的路径
        String sqlPath = "";
        //定义文件保存的本地路径
        String localPath = request.getSession().getServletContext().getRealPath("/statics/js");
        //System.out.print(localPath);
        //String localPath="/opt/Report/";
        //定义 文件名
        String filename=null;
        // 如果文件不存在就创建
        File folder = new File(localPath);
        //文件夹路径不存在
        if (!folder.exists() && !folder.isDirectory()) {
            folder.mkdirs();
        }
        if(!duizhang.getDzFile().isEmpty()){
            //获得文件类型（可以判断如果不是图片，禁止上传）
            //String contentType=Duizhang.getDuizhangFile().getContentType();
            //获得文件后缀名
            //String suffixName=contentType.substring(contentType.indexOf("/")+1);
            String originalFileName = duizhang.getDzFile().getOriginalFilename();
            // 新文件名
            //String newFileName = "sliver" + originalFileName.substring(originalFileName.lastIndexOf("."));
            //得到 文件名
            filename=originalFileName;
            //文件保存路径
            duizhang.getDzFile().transferTo(new File(localPath+filename));
        }
        //把图片的相对路径保存至数据库
        sqlPath = "/"+filename;
        if(filename!=null)
            duizhang.setUrl(sqlPath);

        int num = duizhangService.addDz(duizhang);
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
    @RequestMapping("/dropSelect/")
    @ResponseBody
    public pageBaen dropSelect(String page, String rows, String advanceFilter, String sort, String oder, String q){
        pageBaen pages = new pageBaen();
        //如果q不为空的话那就是客户下拉框进来的查询
        if(page==null && rows==null && advanceFilter==null && sort==null && oder==null ){//下拉搜索框进来的查询
            System.out.println("下拉框进来的查询");
            List<Duizhang> list = duizhangService.dropSelect(q);
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
    @RequestMapping("/getList/")
    @ResponseBody
    public List<Duizhang> getList() {
        //查询所有送货单
        List<Duizhang> list=new ArrayList<Duizhang>();
        list = duizhangService.getList();
        if (list != null) {
            return list;
        } else {
            return null;
        }
    }
    @RequestMapping("/DuizhangList/")
    @ResponseBody
    private pageBaen DuizhangList(int page, int rows, String advanceFilter, String sort, String oder){
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
        List<Duizhang>list=duizhangService.select(cur,rows,sort,oder,queryList);
        List<Duizhang>listAll=duizhangService.selectAll(queryList);
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
    public ModelAndView jump(String url, int id){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("id",id);
        modelAndView.setViewName(url);
        return modelAndView;
    }

    @RequestMapping("/deleteDz/")
    @ResponseBody
    public void deleteDz(HttpServletResponse response,String id) {
        Msg msg = new Msg();
        String sid = null;
        sid = id.replaceAll("'", "");//去除单引号0
        int num =0;
        for(int i=0;i<sid.split(",").length;i++) {
            String de=sid.split(",")[i];
            num = duizhangService.deleteDz(Integer.parseInt(de));
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

    @RequestMapping("/updataDz/")
    @ResponseBody
    public void updataDz(HttpServletResponse response,Duizhang duizhang,HttpServletRequest request)throws IllegalStateException, IOException {
        Msg msg = new Msg();
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        //保存数据库的路径
        String sqlPath = "";
        //定义文件保存的本地路径
        //String localPath = request.getSession().getServletContext().getRealPath("/");
        //System.out.print(localPath);
        String localPath="/opt/Report/";
        //定义 文件名
        String filename=null;
        // 如果文件不存在就创建
        File folder = new File(localPath);
        //文件夹路径不存在
        if (!folder.exists() && !folder.isDirectory()) {
            folder.mkdirs();
        }
        if(!duizhang.getDzFile().isEmpty()){
            //获得文件类型（可以判断如果不是图片，禁止上传）
            //String contentType=Duizhang.getDuizhangFile().getContentType();
            //获得文件后缀名
            //String suffixName=contentType.substring(contentType.indexOf("/")+1);
            String originalFileName = duizhang.getDzFile().getOriginalFilename();
            // 新文件名
            //String newFileName = "sliver" + originalFileName.substring(originalFileName.lastIndexOf("."));
            //得到 文件名
            filename=originalFileName;
            System.out.println(filename);
            //文件保存路径
            duizhang.getDzFile().transferTo(new File(localPath+filename));
        }
        //把图片的相对路径保存至数据库
        sqlPath = "/uploads/knife/"+filename;
        if(filename!=null)
            duizhang.setUrl(sqlPath);
        int num = duizhangService.updateDz(duizhang);
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
    public Duizhang findById(int id) {
        //返回前端的对象
        Duizhang duizhang = new Duizhang();
        duizhang = duizhangService.findById(id);
        return duizhang;
    }


}
