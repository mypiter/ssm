package com.generator.controller;

import com.generator.pojo.BackLog;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.pageBaen;
import com.generator.service.BackLogService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@RequestMapping("/BackLog")
@Controller
public class BackLogController {
    @Resource
    private BackLogService backLogService;


    /**
     * 纸板入库报表查询所有的纸板入库记录
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @param advanceFilter
     * @return
     */
    @RequestMapping("/getList/")
    @ResponseBody
    public pageBaen getList(int page, int rows, String sort, String order, String advanceFilter){
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
        List<BackLog> list = new ArrayList<BackLog>();
        List<BackLog> listAll = new ArrayList<BackLog>();
        list = backLogService.findBackLogList(cur,rows,sort,order,queryList);
        listAll = backLogService.findBackLogListAll(queryList);
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
