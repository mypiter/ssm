package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.Msg;
import com.generator.pojo.SupplierMaterialb;
import com.generator.pojo.pageBaen;
import com.generator.service.supplierMaterialBService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

import static com.generator.common.UserUtil.isEmpty;

@Controller
@RequestMapping("/SupplierMaterialB")
public class SupplierMaterialBController {
    private static final Logger LOG = LoggerFactory.getLogger(SupplierMaterialBController.class);
    @Resource
    private supplierMaterialBService supplierMaterialBService;

    @RequestMapping("/findById/")
    @ResponseBody
    public pageBaen findById(String puuid, int page, int rows){
        pageBaen pages = new pageBaen();
        int cur = (page-1)*rows;
        List<SupplierMaterialb>list=new ArrayList<SupplierMaterialb>();
        List<SupplierMaterialb> listAll=new ArrayList<SupplierMaterialb>();
        if(puuid==null){
        }else {
            list=supplierMaterialBService.findById(Integer.parseInt(puuid),cur,rows);
            //总条数
            listAll=supplierMaterialBService.findByAll(Integer.parseInt(puuid));
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
    @RequestMapping("/addSupplierB/")
    @ResponseBody
    public void addSupplierB(HttpServletResponse response,boolean isNewRecord, int puuid, int type,SupplierMaterialb supplierMaterialb){
        Msg msg=new Msg();
        //验证不能重复使用代码
        SupplierMaterialb supplierM=supplierMaterialBService.findByMaterialb(puuid,supplierMaterialb.getMyCode());
        if(isEmpty(supplierM)){
        //SupplierMaterialb supplierMaterialb=new SupplierMaterialb();
        if(type==1){
            msg.setStatusCode("300");
            msg.setTitle("操作提示");
            msg.setMessage("A类型供应商只能在A类材质中登记！");

        }else{
            //设置插入参数
            supplierMaterialb.setSupplierId(puuid);
            //supplierMaterialb.setMaterialCode(materialCode);
            //supplierMaterialb.setMaterialPrice(materialPrice);
            //supplierMaterialb.setMaterialTexture(materialTexture);
            //supplierMaterialb.setSpecialOffer(specialOffer);
            //supplierMaterialb.setSquarePrice(squarePrice);
            //supplierMaterialb.setMyCode(myCode);
            supplierMaterialb.setFake(0);
            //supplierMaterialb.setFluteType(fluteType);
            int num=supplierMaterialBService.addSupplierB(supplierMaterialb);
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
        }else{
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败！该代码已经被使用了");
        }
        ResponseUtil.writeJson(response,msg);
    }
    @RequestMapping("/updataSupplier/")
    @ResponseBody
    public void updataSupplier(HttpServletResponse response,SupplierMaterialb supplierMaterialb){
        Msg msg=new Msg();
        int num=supplierMaterialBService.updateSupplierB(supplierMaterialb);
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
    @RequestMapping("/deleteSupplier/")
    @ResponseBody
    public void deleteSupplier(HttpServletResponse response,String id){
        Msg msg=new Msg();
        String sid=null;
        sid=id.replaceAll("'", "");//去除单引号0
        String[] ssid = sid.split(",");
        List<SupplierMaterialb> list = new ArrayList<>();
        for(int i=0;i<ssid.length;i++){
            SupplierMaterialb supplierMaterialb = new SupplierMaterialb();
            supplierMaterialb.setId(Integer.valueOf(ssid[i].trim()));
            list.add(supplierMaterialb);
        }
        int num=supplierMaterialBService.batchDeleteSupplierB(list);//批量删除
//        int num=supplierMaterialBService.deleteSupplierB(Integer.parseInt(sid));单个删除
        if(num>0){
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("删除成功！");
        }else{
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("删除失败！");
        }
        ResponseUtil.writeJson(response,msg);
    }


}
