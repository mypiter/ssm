package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.CartonSupplier;
import com.generator.pojo.Msg;
import com.generator.pojo.pageBaen;
import com.generator.service.CartonSupplierService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * 供应商
 */
@Controller
@RequestMapping("/CartonSupplier")
public class CartonSupplierController {
    private static final Logger LOG = LoggerFactory.getLogger(CartonSupplierController.class);
    @Resource
    private CartonSupplierService cartonSupplierService;

    @RequestMapping("/addSupplier/")
    @ResponseBody
    public void addSupplier(HttpServletResponse response,CartonSupplier cartonSupplier){
        //返回前端的操作提示
        Msg msg=new Msg();
        int num=cartonSupplierService.insertSupperlier(cartonSupplier);
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
    @RequestMapping("/select/")
    @ResponseBody
    private pageBaen select(int page, int rows, String advanceFilter, String sort, String oder){
        //判断是否为带条件查询
        pageBaen pages=new pageBaen();//分页对象
        if(advanceFilter==null||sort==null||oder==null){
            List<CartonSupplier>list=new ArrayList<CartonSupplier>();
            list=cartonSupplierService.select();
            pages.setRows(list);
            int total=list.size();
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

        }else{
            //这里进行模糊查询

            //将查询条件封装成对象

        }



        return pages;
    }
    @RequestMapping("/updataSupplier/")
    @ResponseBody
    public void updataSupplier(HttpServletResponse response,CartonSupplier cartonSupplier){
        //返回前端的操作提示
        Msg msg=new Msg();
        int num=cartonSupplierService.update(cartonSupplier);
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
    @RequestMapping("/findeById/")
    @ResponseBody
    public CartonSupplier findeById(int uuid){
        //返回前端的对象
        CartonSupplier cartonSupplier=new CartonSupplier();
        cartonSupplier=cartonSupplierService.selectById(uuid);
        if(cartonSupplier!=null){
            return cartonSupplier;
        }else{
            return null;
        }
    }
    @RequestMapping("/deleteSupplier/")
    @ResponseBody
    public void deleteSupplier(HttpServletResponse response,String uuid) {
        //返回前端的操作提示
        Msg msg = new Msg();
        int num=0;
        //处理前端传入的id
        if (uuid.indexOf(",") == -1) {//判断是否包含
            //处理id
            String id=uuid.replaceAll("'", "");//去除单引号0
            num= cartonSupplierService.delete(Integer.parseInt(id));
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
