package com.generator.service;

import com.generator.pojo.ComplexQuery;
import com.generator.pojo.KnifeTemplate;

import java.util.List;

public interface KnifeTemplateService {

    int addKnife(KnifeTemplate knifeTemplate);

    List<KnifeTemplate> dropSelect(String q);

    List<KnifeTemplate> select(int cur, int rows, String sort, String oder, List<ComplexQuery> queryList);

    List<KnifeTemplate> selectAll(List<ComplexQuery> queryList);

    int deleteKnife(int i);

    int updateKnife(KnifeTemplate knifeTemplate);

    KnifeTemplate selectById(int knifeTemplateId);
}
