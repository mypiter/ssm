package com.generator.service;

import com.generator.pojo.Tremenu;

import java.util.List;

/**
        * 三级菜单接口
        * QT001
        */
public interface TremenuService {
    //根据id获取菜单
    List<Tremenu> getByPid(int pid);

}
