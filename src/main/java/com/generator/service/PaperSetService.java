package com.generator.service;

import com.generator.pojo.ComplexQuery;
import com.generator.pojo.PaperSetting;

import java.util.List;

public interface PaperSetService {
    //添加纸张
    int addPaper(PaperSetting paperSetting);
    //查询纸张
    List<PaperSetting> select();
    //查询纸张集合
    List<PaperSetting> findPaperList(int cur, int rows, String sort, String order, List<ComplexQuery> queryList);
    //查询所有纸张
    public List<PaperSetting> findPaperListAll(List<ComplexQuery> queryList);
    //根据ID查询纸张
    public PaperSetting selectById(int paperId);
    //根据Id修改
    public int updatePaper(PaperSetting paperId);
    //删除操作
    public int deletePaper(int paperId);
}
