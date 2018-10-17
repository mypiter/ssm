package com.generator.service.impl;

import com.generator.mapper.TremenuMapper;
import com.generator.pojo.Tremenu;
import com.generator.service.TremenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class TremenuServiceImpl implements TremenuService {

    @Resource
    private TremenuMapper tremenuMapper;

    @Override
    public List<Tremenu> getByPid(int pid) {
        List<Tremenu> list=new ArrayList<Tremenu>();
        list=tremenuMapper.findTremenu(pid);
        return list;
    }

    //根据id获取菜单

}
