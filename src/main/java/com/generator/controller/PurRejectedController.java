package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Msg;
import com.generator.pojo.PurRejected;
import com.generator.pojo.pageBaen;
import com.generator.service.PurRejectedService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 纸板退赔
 */
@Controller
@RequestMapping("/PurRejected")
public class PurRejectedController {
    @Resource
    private PurRejectedService purRejectedService;

    /**
     * 保存退货赔偿记录
     * @param purRejected
     * @return
     */
    @RequestMapping("/addPurRejected/")
    @ResponseBody
    public void addPurRejected(HttpServletResponse response,PurRejected purRejected){
        Msg msg = new Msg();
        purRejected.setFake(0);
        int num = purRejectedService.addPurRejected(purRejected);
        if(num>0){
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("添加成功!");
        }else{
            msg.setStatusCode("300");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败!");
        }
        ResponseUtil.writeJson(response,msg);
    }

    //纸板退货赔偿列表  加载出所有的退货赔偿记录
    @RequestMapping("/findByPurReturn/")
    @ResponseBody
    public pageBaen findByPurReturn(int page,int rows,String sort,String order,String advanceFilter,String startTime,String endTime,String orderAccount,String type){
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
        List<PurRejected> list = new ArrayList<PurRejected>();
        List<PurRejected> listAll = new ArrayList<PurRejected>();
        if (type!=null) {
            if(orderAccount!=null){
                list = purRejectedService.findByPurReturn(cur,rows,sort,order,queryList,startTime,endTime,orderAccount);
                listAll = purRejectedService.findByPurReturnAll(queryList,startTime,endTime,orderAccount);
            }
        }else{
            list = purRejectedService.findByPurReturn(cur,rows,sort,order,queryList,startTime,endTime,orderAccount);
            listAll = purRejectedService.findByPurReturnAll(queryList,startTime,endTime,orderAccount);
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


}
