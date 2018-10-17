package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.*;
import com.generator.service.CompanyInformationService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping("/CompanyInformation")
public class CompanyInformationController {
    @Resource
    private CompanyInformationService companyInformationService;

    /**
     * 公司信息列表
     * @param page
     * @param rows
     * @param advanceFilter
     * @return
     */
    @RequestMapping("/findList/")
    @ResponseBody
    public pageBaen findList(int page,int rows,String advanceFilter){
        pageBaen pageBaen = new pageBaen();
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
        List<CompanyInformation> list = companyInformationService.findList(cur,rows,queryList);
        List<CompanyInformation> listAll = companyInformationService.findListAll(queryList);
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
     * 新增公司信息
     * @param response
     * @param companyInformation
     */
    @RequestMapping("/addCompanyInformation/")
    @ResponseBody
    public void addCompanyInformation(HttpServletResponse response,CompanyInformation companyInformation){
        Msg msg = new Msg();
        companyInformation.setFake(0);
        int num = companyInformationService.addCompanyInformation(companyInformation);
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

    /**
     * 根据id查询公司信息
     * @param id
     * @return
     */
    @RequestMapping("/findById/")
    @ResponseBody
    public CompanyInformation findById(int id){
        CompanyInformation companyInformation = companyInformationService.findById(id);
        return companyInformation;
    }

    /**
     * 编辑公司信息
     * @param response
     * @param companyInformation
     */
    @RequestMapping("updateCompanyInformation")
    @ResponseBody
    public void updateCompanyInformation(HttpServletResponse response,CompanyInformation companyInformation){
        Msg msg = new Msg();
        int num = companyInformationService.updateCompanyInformation(companyInformation);
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

    /**
     * 删除公司信息   可批量
     * @param response
     * @param id
     */
    @RequestMapping("/deleteCompanyInformation/")
    @ResponseBody
    public void deleteCompanyInformation(HttpServletResponse response,String id){
        Msg msg = new Msg();
        id=id.replaceAll("'","");
        String[] ids  =id.split(",");
        List<CompanyInformation> list = new ArrayList<>();
        for (int i = 0; i < ids.length; i++) {
            CompanyInformation companyInformation = new CompanyInformation();
            companyInformation.setId(Integer.valueOf(ids[i].trim()));
            list.add(companyInformation);
        }
        int num = companyInformationService.deleteCompanyInformation(list);
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

    /**
     * 下拉框
     * @param q
     * @return
     */
    @RequestMapping("/getList/")
    @ResponseBody
    public List<CompanyInformation> getList(String q) {
        //查询有成品库存的客户
        List<CompanyInformation> list = new ArrayList<CompanyInformation>();
        list = companyInformationService.select(q);
        return list;
    }
}
