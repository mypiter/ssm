package com.generator.controller;

import com.generator.pojo.Msg;
import com.generator.pojo.ReceivingAddress;
import com.generator.pojo.pageBaen;
import com.generator.service.ReceivingAddressService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 客户收货地址   控制层
 */
@Controller
@RequestMapping("/ReceivingAddress")
public class ReceivingAddressController {
    @Resource
    private ReceivingAddressService receivingAddressService;

    /**
     * 根据客户id查询客户收货地址
     * @param page
     * @param rows
     * @param customId
     * @return
     */
    @RequestMapping("/findByCusId/")
    @ResponseBody
    public pageBaen findByCusId(int page,int rows,String customId){
        pageBaen pageBaen = new pageBaen();
        int cur = (page-1)*rows;
        List<ReceivingAddress> list = new ArrayList<>();
        List<ReceivingAddress> listAll = new ArrayList<>();
        if(customId!=null){
            list=receivingAddressService.findByCusId(cur,rows,customId);
            listAll=receivingAddressService.findByCusIdAll(customId);
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
     * 根据客户id查询客户
     */
    @RequestMapping("/selectByList/")
    @ResponseBody
    public  List<ReceivingAddress> selectBylist(String custom) {
        List<ReceivingAddress> list=new ArrayList<ReceivingAddress>();
        list = receivingAddressService.findByCusIdAll(custom);
        return list;
    }
    /**
     * 客户列表新增客户收货地址
     * @param receivingAddress
     * @return
     */
    @RequestMapping("/addReceivingAddr/")
    @ResponseBody
    public Msg addReceivingAddr(ReceivingAddress receivingAddress){
        Msg msg = new Msg();
        receivingAddress.setFake(0);
        int num = receivingAddressService.addReceivingAddr(receivingAddress);
        if(num>0){
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("添加成功!");
        }else{
            msg.setStatusCode("300");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败");
        }
        return msg;
    }

    /**
     * 客户列表编辑客户收货地址
     * @param receivingAddress
     * @return
     */
    @RequestMapping("/updateReceivingAdderss/")
    @ResponseBody
    public Msg updateReceivingAdderss(ReceivingAddress receivingAddress){
        Msg msg = new Msg();
        int num = receivingAddressService.updateReceivingAdderss(receivingAddress);
        if(num>0){
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("修改成功!");
        }else{
            msg.setStatusCode("300");
            msg.setTitle("操作提示");
            msg.setMessage("修改失败");
        }
        return msg;
    }

    /**
     * 批量客户列表删除客户收货地址
     * @return
     */
    @RequestMapping("/deleteReceivingAdderss/")
    @ResponseBody
    public Msg deleteReceivingAdderss(String id){
        Msg msg = new Msg();
        id=id.replaceAll("'","");
        String[] ids = id.split(",");
        List<ReceivingAddress> list = new ArrayList<>();
        for(int i = 0;i<ids.length;i++){
            ReceivingAddress r = new ReceivingAddress();
            r.setId(Integer.valueOf(ids[i]));
            list.add(r);
        }
        int num = receivingAddressService.deleteReceivingAdderss(list);
        if(num>0){
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("删除成功!");
        }else{
            msg.setStatusCode("300");
            msg.setTitle("操作提示");
            msg.setMessage("删除失败");
        }
        return msg;
    }
}
