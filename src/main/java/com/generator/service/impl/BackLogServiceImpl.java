package com.generator.service.impl;

import com.generator.mapper.BackLogMapper;
import com.generator.pojo.BackLog;
import com.generator.pojo.ComplexQuery;
import com.generator.service.BackLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BackLogServiceImpl implements BackLogService {

    @Resource
    private BackLogMapper backLogMapper;


    public List<BackLog> select() {
        return backLogMapper.select();
    }

    public List<BackLog> findBackLogList(int cur, int rows, String sort, String order, List<ComplexQuery> queryList){
        return backLogMapper.findPaperList(cur,rows,sort,order,queryList);
    }

    public List<BackLog> findBackLogListAll(List<ComplexQuery> queryList){
        return backLogMapper.findPaperListAll(queryList);
    }
    public BackLog selectById(int paperId){
        return backLogMapper.selectByPrimaryKey(paperId);
    }


    public int deleteBackLog(int paperId){
        return backLogMapper.deleteByPrimaryKey(paperId);
    }

    public int addBackLog(BackLog backLog){
        return  backLogMapper.insert(backLog);
    }
}
