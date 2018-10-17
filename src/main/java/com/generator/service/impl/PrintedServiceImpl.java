package com.generator.service.impl;

import com.generator.mapper.PrintedMapper;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Printed;
import com.generator.service.PrintedService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class PrintedServiceImpl implements PrintedService {
    @Resource
    PrintedMapper printedMapper;

    /**
     * 印版下拉框查询所有的印版信息
     * @return
     */
    @Override
    public List<Printed> dropSelect(String q) {
        List<Printed>list =new ArrayList<Printed>();
        list=printedMapper.dropSelect(q);
        return list;
    }

    @Override
    public int addPrinted(Printed printed) {
        int num=printedMapper.insertSelective(printed);
        return num;
    }

    @Override
    public List<Printed> select(int cur, int rows, String sort, String oder, List<ComplexQuery> queryList) {
        return printedMapper.select(cur,rows,sort,oder,queryList);
    }

    @Override
    public List<Printed> selectAll(List<ComplexQuery> queryList) {
        return printedMapper.selectAll(queryList);
    }

    @Override
    public int deletePrinted(int i) {
        return printedMapper.deleteByPrimaryKey(i);
    }

    @Override
    public int updatePrinted(Printed printed) {
        return printedMapper.updateByPrimaryKeySelective(printed);
    }

    @Override
    public Printed selectById(int printedId) {
        return printedMapper.selectByPrimaryKey(printedId);
    }
}
