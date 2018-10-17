package com.generator.service.impl;

import com.generator.mapper.WorkingProcedureMapper;
import com.generator.pojo.WorkingProcedure;
import com.generator.service.WorkingProcedureService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class WorkingProcedureServiceImpl implements WorkingProcedureService {
    @Resource
    WorkingProcedureMapper workingProcedureMapper;

    @Override
    public List<WorkingProcedure> select() {
        return workingProcedureMapper.select();
    }

    @Override
    public int addWP(WorkingProcedure workingProcedure) {
        return workingProcedureMapper.insertSelective(workingProcedure);
    }

    @Override
    public int updateWP(WorkingProcedure workingProcedure) {
        return workingProcedureMapper.updateByPrimaryKey(workingProcedure);
    }

    @Override
    public int deleteWP(int id) {
        return workingProcedureMapper.deleteByPrimaryKey(id);
    }

    @Override
    public WorkingProcedure selectById(int id) {
        return workingProcedureMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<WorkingProcedure> selectByco(String[] str) {
        return workingProcedureMapper.selectByco(str);
    }
}
