package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.Msg;
import com.generator.pojo.PaperA;
import com.generator.pojo.SupplierMateriala;
import com.generator.pojo.pageBaen;
import com.generator.service.PaperAService;
import com.generator.service.impl.supplierMaterialAServiceImpl;
import com.generator.service.supplierMaterialAService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/SupplierMaterialA")
@Controller
public class SupplierMaterialAController {

    private static final Logger LOG = LoggerFactory.getLogger(SupplierMaterialAController.class);
    @Resource
    private supplierMaterialAService supplierMaterialAService;
    @Resource
    private PaperAService paperAService;

    @RequestMapping("/findById/")
    @ResponseBody
    public pageBaen findById(int puuid, int page, int rows){
        pageBaen pages = new pageBaen();
        int cur = (page-1)*rows;
        if(puuid==0){
            puuid=1;
        }
        List<SupplierMateriala>list=new ArrayList<SupplierMateriala>();
                //数据
                list=supplierMaterialAService.findById(puuid,cur,rows);
                //总条数
                List<SupplierMateriala> listAll=supplierMaterialAService.findByAll(puuid);
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
    @RequestMapping("/addSupplierA/")
    @ResponseBody
    public void addSupplierA(HttpServletResponse response,boolean isNewRecord, int type, int puuid, String materialTexture, String materialCode, double specialPrice, String fluteType){
        Msg msg=new Msg();
        SupplierMateriala supplierMateriala=new SupplierMateriala();
        if(type==2){
            msg.setStatusCode("300");
            msg.setTitle("操作提示");
            msg.setMessage("B类型供应商只能在B类材质中登记！");
        }else{
            //设置插入参数
            String strCode = paperAService.selectMyCodeByCo(puuid,materialCode);
            supplierMateriala.setSupplierId(puuid);
            supplierMateriala.setMaterialCode(materialCode);
            supplierMateriala.setMaterialTexture(materialTexture);
            supplierMateriala.setMyCode(strCode);
            supplierMateriala.setSpecialPrice(specialPrice);
            supplierMateriala.setFake(0);
            supplierMateriala.setFluteType(fluteType);
            //相同材质刷掉
            SupplierMateriala supplier=supplierMaterialAService.findByCode(materialCode,strCode,fluteType);
            if(supplier!=null){
                msg.setStatusCode("300");
                msg.setTitle("操作提示");
                msg.setMessage("添加失败，存在相同材质数据！");
            }else{
                if(strCode!=null){
                    int num=supplierMaterialAService.addSupplierA(supplierMateriala);
                    if(num>0){
                        msg.setStatusCode("200");
                        msg.setTitle("操作提示");
                        msg.setMessage("添加成功！");
                    }else{
                        msg.setStatusCode("500");
                        msg.setTitle("操作提示");
                        msg.setMessage("添加失败！");
                    }
                }else{
                    msg.setStatusCode("500");
                    msg.setTitle("操作提示");
                    msg.setMessage("添加失败！");
                }
            }
        }
        ResponseUtil.writeJson(response,msg);
    }
    @RequestMapping("/updataSupplier/")
    @ResponseBody
    public void updataSupplier(HttpServletResponse response,SupplierMateriala supplierMateriala){
        Msg msg=new Msg();

        System.out.println(supplierMateriala.getSupplierId()+"xitongdaihao:"+supplierMateriala.getMaterialCode());
        String newCode = paperAService.selectMyCodeByCo(supplierMateriala.getSupplierId(),supplierMateriala.getMaterialCode());
        System.out.println("新的代号"+newCode);
        supplierMateriala.setMyCode(newCode);
        if(newCode!=null){
            int num=supplierMaterialAService.updateSupplierA(supplierMateriala);
            if(num>0 && newCode!=null){
                msg.setStatusCode("200");
                msg.setTitle("操作提示");
                msg.setMessage("修改成功！");
            }else{
                msg.setStatusCode("500");
                msg.setTitle("操作提示");
                msg.setMessage("修改失败！");
            }
        }else{
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败！");
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
        List<SupplierMateriala> list = new ArrayList<>();
        for(int i=0;i<ssid.length;i++){
            SupplierMateriala supplierMateriala  =new SupplierMateriala();
            supplierMateriala.setId(Integer.valueOf(ssid[i].trim()));
            list.add(supplierMateriala);
        }
        int num=supplierMaterialAService.batchDeleteSupplierA(list);
//        int num=supplierMaterialAService.deleteSupplierA(Integer.parseInt(sid));
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
