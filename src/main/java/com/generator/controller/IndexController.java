package com.generator.controller;
import com.generator.pojo.Tremenu;
import com.generator.pojo.Twomenu;
import com.generator.service.TremenuService;
import com.generator.service.TwomenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 首页
 */
@Controller
@RequestMapping("/IndexController")
public class IndexController {

    private static final Logger LOG = LoggerFactory.getLogger(AdminController.class);

    @Resource
    private TwomenuService twomenuService;
    @Resource
    private TremenuService tremenuService;

    @RequestMapping("/getTwomenu/")
    @ResponseBody
    public List<Twomenu> getTwomenu(int pid) {
        List<Twomenu> list=new ArrayList<Twomenu>();
        list = this.twomenuService.getById(pid);
        return list;
    }
    @RequestMapping("/getTremenu/")
    @ResponseBody
    public List<Tremenu> getTremenu(int pid) {
        List<Tremenu> list= new ArrayList<Tremenu>();
        list = this.tremenuService.getByPid(pid);
        return list;
    }
}
