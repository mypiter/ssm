package com.generator.service;

import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Rejected;

import java.util.List;

public interface RejectedService {

    int addRejected(Rejected rejected);

    List<Rejected> select(int cur, int rows, String sort, String oder, List<ComplexQuery> queryList);

    List<Rejected> selectAll(List<ComplexQuery> queryList);

    int deleteRejected(int i);

    Rejected selectById(int rejectedId);

    int updateRejected(Rejected rejected);
}
