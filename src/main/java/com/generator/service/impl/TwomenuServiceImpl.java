package com.generator.service.impl;

import com.generator.mapper.TwomenuMapper;
import com.generator.pojo.Twomenu;
import com.generator.service.TwomenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TwomenuServiceImpl implements TwomenuService {

    @Resource
    private TwomenuMapper twomenuMapper;
    @Override
    public List<Twomenu> getById(int pid) {
         List<Twomenu> list=null;
         list=twomenuMapper.selectByPid(pid);
        return list;
    }
}
