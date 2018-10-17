package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.*;
import com.generator.service.CustomService;
import com.generator.service.PlaceService;
import com.generator.service.ReceivingAddressService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 客户信息控制层
 */
@Controller
@RequestMapping("/CustomController")
public class CustomController {
    private static final Logger LOG = LoggerFactory.getLogger(CustomController.class);
    @Resource
    private CustomService customService;
    @Resource
    private PlaceService placeService;
    @Resource
    private ReceivingAddressService receivingAddressService;

    //新增客户信息
    @RequestMapping("/addCustom/")
    @ResponseBody
    public void addCustom(HttpServletResponse response,Custom custom,String receivingAddress,String consignee,String consigneeTel){
        Msg msg = new Msg();
        custom.setFake(0);
        //1.保存客户并返回主键
        int num = customService.addCustom(custom);
        if(num>0){
            //2.保存客户收货地址
            if(receivingAddress!=null){
                List<ReceivingAddress> list = new ArrayList<>();
                String[] receivingAddressS = receivingAddress.split(",");
                String[] consigneeS = consignee.split(",");
                String[] consigneeTelS = consigneeTel.split(",");
                for(int i=0;i<receivingAddressS.length;i++){
                    ReceivingAddress receivingAddr = new ReceivingAddress();
                    receivingAddr.setCustomId(custom.getCustomId());
                    receivingAddr.setFake(0);
                    receivingAddr.setReceivingAddress(receivingAddressS[i]);
                    receivingAddr.setConsignee(consigneeS[i]);
                    receivingAddr.setConsigneeTel(consigneeTelS[i]);
                    list.add(receivingAddr);
                }
                int n = receivingAddressService.addS(list);//批量添加客户收货地址
                if(n>0){
                    msg.setStatusCode("200");
                    msg.setTitle("操作提示");
                    msg.setMessage("添加成功！");
                }else{
                    msg.setStatusCode("300");
                    msg.setTitle("操作提示");
                    msg.setMessage("添加失败！");
                }
            }else{
                msg.setStatusCode("200");
                msg.setTitle("操作提示");
                msg.setMessage("添加成功！");
            }
        }else{
            msg.setStatusCode("300");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败！");
        }
        ResponseUtil.writeJson(response,msg);
    }

    //客户查询
    @RequestMapping("/select/")
    @ResponseBody
    public pageBaen dropSelect(String page, String rows, String advanceFilter, String sort, String oder,String q){
         pageBaen pages = new pageBaen();
        //如果q不为空的话那就是客户下拉框进来的查询
        if(page==null && rows==null && advanceFilter==null && sort==null && oder==null ){//下拉搜索框进来的查询
//            System.out.println("下拉框进来的查询");
            List<Custom> list = customService.selects(q);
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

    @RequestMapping("/findById/")
    @ResponseBody
    public Custom findById(int customId) {
        //返回前端的对象
        Custom custom = new Custom();
        custom = customService.selectById(customId);
        return custom;
    }

    /**
     * 跳转订单编辑页面
     * @param url
     * @param customId
     * @return
     */
    @RequestMapping("/edit/")
    public ModelAndView jump(String url, int customId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("customId",customId);
        modelAndView.setViewName(url);
        return modelAndView;
    }

    /**
     * 跳转到送货单格式预览页面
     * @param url
     * @param urll
     * @return
     */
    @RequestMapping("/jumpDivelySee/")
    public ModelAndView jumpDivelySee(String url,String urll){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("urll",urll);
        modelAndView.setViewName(url);
        return modelAndView;
    }


    @RequestMapping("/CustomList/")
    @ResponseBody
    private pageBaen userList(int page, int rows, String advanceFilter, String sort, String oder){
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
        List<Custom>list=customService.select(cur,rows,sort,oder,queryList);
        List<Custom>listAll=customService.selectAlls(queryList);
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

    @RequestMapping("/updataCustom/")
    @ResponseBody
    public void updataCustom(HttpServletResponse response,Custom custom) {
        Msg msg = new Msg();
        int num = customService.updateCustom(custom);
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

    @RequestMapping("/deleteCustom/")
    @ResponseBody
    public void deleteCustom(HttpServletResponse response,String customId,String customName) {
        Msg msg = new Msg();
        String sid = null;
        List<Custom> listCustom = new ArrayList<Custom>();
        sid = customId.replaceAll("'", "");//去除单引号0
        customName = customName.replaceAll("'", "");
        String[] customS = sid.split(",");
        String[] customNS = customName.split(",");
        for(int i=0;i<customNS.length;i++){
            List<Place> list = placeService.findByCustom(customNS[i]);
            if(list.size()!=0){
                for(int j=0;j<list.size();j++){
                    Place place = list.get(i);
                    if(place.getOrderState()!=6){
                        msg.setStatusCode("500");
                        msg.setTitle("操作提示");
                        msg.setMessage("客户"+customNS[i]+"有未完成的订单，删除失败！");
                        ResponseUtil.writeJson(response,msg);
                    }
                }
                Custom custom = new Custom();
                custom.setCustomId(Integer.valueOf(customS[i]));
                listCustom.add(custom);
            }else{
                Custom custom = new Custom();
                custom.setCustomId(Integer.valueOf(customS[i]));
                listCustom.add(custom);
            }
        }
        int num= customService.updateByCusFakeS(listCustom);
        if (num > 0) {
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("删除成功！");
        } else {
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("删除失败");
        }
        ResponseUtil.writeJson(response,msg);
    }

    @RequestMapping("/getListByPid/")
    @ResponseBody
    public List<Custom> getListByPid() {
        //返回前端的对象
        List<Custom> list=new ArrayList<Custom>();
        list = customService.getListByPid();
        if (list != null) {
            return list;
        } else {
            return null;
        }
    }

    @RequestMapping("/demo/")
    @ResponseBody
    public JSONObject demo(){
        JSONObject jsonObject = new JSONObject();
        List<Custom> list = customService.getListByPid();
        jsonObject.put("Table",list);
        return jsonObject;
    }
}
