package com.generator.service;

import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Dively;

import java.util.List;

/**
 * 送货单报表接口
 */
public interface DivelyService {

    int addDiv(Dively dively);

    List<Dively> dropSelect(String q);

    List<Dively> select(int cur, int rows, String sort, String oder, List<ComplexQuery> queryList);

    List<Dively> selectAll(List<ComplexQuery> queryList);

    int deleteDiv(int i);

    int updateDiv(Dively dively);

    Dively findById(int id);

    List<Dively> getList(int biao);
}
