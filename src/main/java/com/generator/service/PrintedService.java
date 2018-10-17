package com.generator.service;

import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Printed;

import java.util.List;

public interface PrintedService {

    /**
     * 印版编号下拉框查询
     * @param q
     * @return
     */
    List<Printed> dropSelect(String q);

    int addPrinted(Printed printed);

    List<Printed> select(int cur, int rows, String sort, String oder, List<ComplexQuery> queryList);

    List<Printed> selectAll(List<ComplexQuery> queryList);

    int deletePrinted(int i);

    int updatePrinted(Printed printed);

    Printed selectById(int printedId);
}
