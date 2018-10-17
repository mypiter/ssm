package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.Color;
import com.generator.pojo.Msg;
import com.generator.service.ColorService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/Color")
@Controller
public class ColorController {
    @Resource
    private ColorService colorService;
    @RequestMapping("/getList/")
    @ResponseBody
    public List<Color> getList() {
        //查询所有送货单
        List<Color> list=new ArrayList<Color>();
        list = colorService.select();
        if (list != null) {
            return list;
        } else {
            return null;
        }
    }
    @RequestMapping("/addColor/")
    @ResponseBody
    public void addColor(HttpServletResponse response,Color color){
        Msg msg = new Msg();
        //根据输入颜色查询是否存在
        List<Color> list=colorService.selectByColor(color.getColor());
        if(list.size()>0){
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败！已经存在相同颜色！");
        }else{
            int num=colorService.addColor(color);
            if (num >0) {
                msg.setStatusCode("200");
                msg.setTitle("操作提示");
                msg.setMessage("添加成功！");
            }else{
                msg.setStatusCode("500");
                msg.setTitle("操作提示");
                msg.setMessage("添加失败！");
            }
        }
        ResponseUtil.writeJson(response,msg);
    }

}
