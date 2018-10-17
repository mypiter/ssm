package com.generator.service;


import com.generator.pojo.BackLog;
import com.generator.pojo.ComplexQuery;


import java.util.List;


public interface BackLogService {

    public List<BackLog> select();

    public List<BackLog> findBackLogList(int cur, int rows, String sort, String order, List<ComplexQuery> queryList);

    public List<BackLog> findBackLogListAll(List<ComplexQuery> queryList);

    public BackLog selectById(int paperId);

    public int deleteBackLog(int paperId);

    public int addBackLog(BackLog backLog);
}
