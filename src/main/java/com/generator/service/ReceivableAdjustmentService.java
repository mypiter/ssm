package com.generator.service;

import com.generator.pojo.ComplexQuery;
import com.generator.pojo.ReceivableAdjustment;

import java.util.List;

public interface ReceivableAdjustmentService {
    int addReceivable(ReceivableAdjustment receivableAdjustment);

    List<ReceivableAdjustment> loadReceivableList(int cur, int rows, String sort, String order, List<ComplexQuery> queryList);

    List<ReceivableAdjustment> loadReceivableListAll(List<ComplexQuery> queryList);
}
