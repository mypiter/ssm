package com.generator.service;

import com.generator.pojo.Twomenu;

import java.util.List;

/**
 * 二级菜单接口
 * QT001
 */
public interface TwomenuService {
    //根据id获取菜单
    List<Twomenu> getById(int pid);


}
