package com.generator.service;


import com.generator.pojo.PaperChange;
import java.util.List;

/**
 * 供应商换纸接口
 */
public interface PaperChangeService {
    //根据供应商id查询换纸信息
    List<PaperChange> selectById(int id,int cur,int rows);
    List<PaperChange> findAll(int id);
    //供应商换纸登记
    int addPaper(PaperChange paperChange);
    //供应商换纸修改
    int updatePaper(PaperChange paperChange);
    //供应商换纸删除
    int deleteYPaper(int id);
    //根据原纸和替换纸查询换纸价
    List<PaperChange> selectPrice(String yz,String th);

}
