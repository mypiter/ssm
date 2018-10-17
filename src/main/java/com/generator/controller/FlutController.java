package com.generator.controller;


import com.generator.common.ResponseUtil;
import com.generator.pojo.*;
import com.generator.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * 楞型设置控制层
 */
@RequestMapping("/Flut")
@Controller
public class FlutController {
    @Resource
    private FlutTypeService flutTypeService;

    @Resource
    private PlaceService placeService;

    @Resource
    private ProductRegisterService productRegisterService;

    @Resource
    private CartonFormulaService cartonFormulaService;

    @Resource
    private CartonPitRelationService cartonPitRelationService;

    @RequestMapping("/addFT/")
    public void addFT(HttpServletResponse response, Flut flut){
        Msg msg=new Msg();
        flut.setCoefficient(0.0);
        int num=flutTypeService.addFT(flut);
        if(num>0){
            String q = null;
            List<CartonFormula> list = cartonFormulaService.dropSelectCarton(q);
            if(list.size()>0){
                List<CartonPitRelation> listP = new ArrayList<>();
                for (int i = 0; i < list.size(); i++) {
                    CartonPitRelation cartonPitRelation = new CartonPitRelation();
                    cartonPitRelation.setPitId(flut.getId());
                    cartonPitRelation.setPitName(flut.getName());
                    cartonPitRelation.setCoefficient(0.0);
                    cartonPitRelation.setCartonId(list.get(i).getId());
                    cartonPitRelation.setCartonName(list.get(i).getCartonName());
                    cartonPitRelation.setFake(0);
                    listP.add(cartonPitRelation);
                }
                int n = cartonPitRelationService.addRelatinS(listP);
                if(n>0){
                    msg.setStatusCode("200");
                    msg.setTitle("操作提示");
                    msg.setMessage("添加成功！");
                }else{
                    msg.setStatusCode("500");
                    msg.setTitle("操作提示");
                    msg.setMessage("添加失败！");
                }
            }else{
                msg.setStatusCode("200");
                msg.setTitle("操作提示");
                msg.setMessage("添加成功！");
            }
        }else{
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败！");
        }
        ResponseUtil.writeJson(response,msg);
    }
    @RequestMapping("/findeById/")
    @ResponseBody
    public Flut findeById(int id){
        Flut flut=flutTypeService.selectById(id);
        return flut;
    }
    @RequestMapping("/updateFT/")
    public void updateFT(HttpServletResponse response,Flut flut){
        Msg msg=new Msg();
        int num=flutTypeService.updateFT(flut);
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
        List<Flut> list=new ArrayList<Flut>();
        list=flutTypeService.select();
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
    @RequestMapping("/delect/")
    @ResponseBody
    public void delect(HttpServletResponse response,String id){
        Msg msg=new Msg();
        int num;
        //处理前端传入的id
        if (id.indexOf(",") == -1) {//判断是否包含
            //处理id
            String ids=id.replaceAll("'", "");//去除单引号0
            List<Place> listp = placeService.findByPitId(Integer.parseInt(ids));
            if(listp.size()>0){
                msg.setStatusCode("300");
                msg.setTitle("操作提示");
                msg.setMessage("因为该楞型被订单所绑定，暂时无法删除！");
                ResponseUtil.writeJson(response,msg);
                return;
            }

            List<CartonplantModel2> list = productRegisterService.findByPitId(Integer.parseInt(ids));
            if(list.size()>0){
                msg.setStatusCode("300");
                msg.setTitle("操作提示");
                msg.setMessage("因为该楞型被产品库产品所绑定，暂时无法删除！");
                ResponseUtil.writeJson(response,msg);
                return;
            }

            num= flutTypeService.deleteFT(Integer.parseInt(ids));
            if (num > 0) {
                int n = cartonPitRelationService.deleteByPitId(Integer.parseInt(ids));
                if(n>0){
                    msg.setStatusCode("200");
                    msg.setTitle("操作提示");
                    msg.setMessage("删除成功！");
                } else {
                    msg.setStatusCode("500");
                    msg.setTitle("操作提示");
                    msg.setMessage("删除失败！");
                }
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
    @RequestMapping("/getQ/")
    @ResponseBody
    public List<Flut> getQ() {
        //查询有成品库存的客户
        List<Flut> list=new ArrayList<Flut>();
        list = flutTypeService.select();
        return list;
    }

    /**
     * 箱型设置中加载所有的楞型
     * @return
     */
    @RequestMapping("/getAll/")
    @ResponseBody
    public pageBaen getAll(){
        pageBaen pageBaen = new pageBaen();
        List<Flut> list = flutTypeService.select();
        pageBaen.setCode(0);
        pageBaen.setCount(list.size());
        pageBaen.setData(list);
        pageBaen.setMsg("");
        return pageBaen;
    }
}
