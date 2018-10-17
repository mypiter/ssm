package com.generator.service;

import com.generator.pojo.ComplexQuery;
import com.generator.pojo.StaffTable;

import java.util.List;

public interface StaffTableService {

    List<StaffTable> selectAll();

    int addstaffTable(StaffTable staffTable);

    int updateStaff(StaffTable staffTabl);

    StaffTable selectById(int staffId);

    int deleteStaff(int staffId);

    List<StaffTable> select();

    List<StaffTable> dropSelect(String q);

    List<StaffTable> selects(int cur, int rows, String sort, String oder, List<ComplexQuery> queryList);

    List<StaffTable> selectAlls(List<ComplexQuery> queryList);

    /**
     * 业务员下拉框查询
     * @param q
     * @return
     */
    List<StaffTable> findByBusiness(String q,int type);

    /**
     * 获得最大的员工工号
     * @return
     */
    StaffTable staffTableBystaffNumber();
}
