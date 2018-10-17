package com.generator.service;

import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Duizhang;

import java.util.List;

public interface DuizhangService {
    int addDz(Duizhang duizhang);

    List<Duizhang> dropSelect(String q);

    List<Duizhang> select(int cur, int rows, String sort, String oder, List<ComplexQuery> queryList);

    List<Duizhang> selectAll(List<ComplexQuery> queryList);

    int deleteDz(int i);

    int updateDz(Duizhang duizhang);

    Duizhang findById(int id);

    List<Duizhang> getList();
}
