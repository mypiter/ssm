package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.CartonPitRelation;
import com.generator.pojo.MakingStock;
import com.generator.pojo.Msg;
import com.generator.pojo.pageBaen;
import com.generator.service.CartonPitRelationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * 箱型楞型关系控制层
 */
@Controller
@RequestMapping("/CartonPitRelation")
public class CartonPitRelationController {
    @Resource
    private CartonPitRelationService cartonPitRelationService;

    /**
     * 通过箱型id加载出该箱型的所有楞型系数
     * @param page
     * @param rows
     * @param id
     * @return
     */
    @RequestMapping("/findByCartonId/")
    @ResponseBody
    public pageBaen findByCartonId(int page,int rows,String id){
        pageBaen pageBaen = new pageBaen();
        int cur = (page-1)*rows;
        List<CartonPitRelation> list = new ArrayList<CartonPitRelation>();
        List<CartonPitRelation> listAll = new ArrayList<CartonPitRelation>();
        if(id!=null && !id.equals("")){
            list=cartonPitRelationService.findByCartonId(cur,rows,Integer.valueOf(id));
            listAll=cartonPitRelationService.findByCartonIdAll(Integer.valueOf(id));
        }
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

    /**
     * 修改箱型楞型系数
     * @param response
     * @param cartonPitRelation
     */
    @RequestMapping("/updateCartonPit/")
    @ResponseBody
    public void updateCartonPit(HttpServletResponse response,CartonPitRelation cartonPitRelation){
        Msg msg = new Msg();
        int num = cartonPitRelationService.updateCartonPit(cartonPitRelation);
        if(num>0){
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("修改成功!");
        }else {
            msg.setStatusCode("300");
            msg.setTitle("操作提示");
            msg.setMessage("修改失败!");
        }
        ResponseUtil.writeJson(response,msg);
    }
}
