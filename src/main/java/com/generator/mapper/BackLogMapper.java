package com.generator.mapper;

import com.generator.pojo.BackLog;
import com.generator.pojo.ComplexQuery;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BackLogMapper {

    BackLog selectByPrimaryKey(int id);

    List<BackLog> select();

    int deleteByPrimaryKey(int id);

    int insert(BackLog backLog);

    int insertSelective(BackLog backLog);
    /**
     * 分页查询纸张报表
     * @param cur
     * @param rows
     * @param sort
     * @param order
     * @param queryList
     * @return
     */
    List<BackLog> findPaperList(@Param("cur") int cur, @Param("rows") int rows, @Param("sort") String sort, @Param("order") String order, @Param("list") List<ComplexQuery> queryList);

    /**
     * 查询所有纸张报表
     * @param queryList
     * @return
     */
    List<BackLog> findPaperListAll(@Param("list") List<ComplexQuery> queryList);
}
