package com.generator.service.impl;

import com.generator.mapper.StaffTableMapper;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.StaffTable;

import com.generator.service.StaffTableService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class StaffTableServiceImpl implements StaffTableService {
    @Resource
    StaffTableMapper staffTableMapper;
    @Override
    public List<StaffTable> selectAll() {
        List<StaffTable>list=new ArrayList<StaffTable>();
        list=staffTableMapper.selectAll();//这里需要实现结果集转化
        return list;
    }

    @Override
    public int addstaffTable(StaffTable staffTable) {
        int num=staffTableMapper.insertSelective(staffTable);
        return num;
    }

    @Override
    public int updateStaff(StaffTable staffTabl) {
        int num=staffTableMapper.updateByPrimaryKeySelective(staffTabl);
        return num;
    }

    @Override
    public StaffTable selectById(int staffId) {
        StaffTable staffTable=new StaffTable();
        staffTable=staffTableMapper.selectById(staffId);
        return staffTable;
    }

    @Override
    public int deleteStaff(int staffId) {
        int num = staffTableMapper.deleteByPrimaryKey(staffId);
        return num;
    }

    @Override
    public List<StaffTable> select() {
        List<StaffTable>list =new ArrayList<StaffTable>();
        list=staffTableMapper.selects();
        return list;
    }

    @Override
    public List<StaffTable> dropSelect(String q) {
        List<StaffTable>list =new ArrayList<StaffTable>();
        list=staffTableMapper.dropSelect(q);
        return list;
    }

    @Override
    public List<StaffTable> selects(int cur, int rows, String sort, String oder, List<ComplexQuery> queryList) {
        return staffTableMapper.selectd(cur,rows,sort,oder,queryList);
    }

    @Override
    public List<StaffTable> selectAlls(List<ComplexQuery> queryList) {
        return staffTableMapper.selectAlld(queryList);
    }

    @Override
    public List<StaffTable> findByBusiness(String q ,int type) {
        return staffTableMapper.findByBusiness(q,type);
    }

    @Override
    public StaffTable staffTableBystaffNumber() {
        return staffTableMapper.staffTableBystaffNumber();
    }

}
