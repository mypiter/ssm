package com.generator.mapper;

import com.generator.pojo.CartonStock;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.ProductionList;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartonStockMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carton_stock
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer stockId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carton_stock
     *
     * @mbggenerated
     */
    int insert(CartonStock record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carton_stock
     *
     * @mbggenerated
     */
    int insertSelective(CartonStock record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carton_stock
     *
     * @mbggenerated
     */
    CartonStock selectByPrimaryKey(Integer stockId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carton_stock
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(CartonStock record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carton_stock
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(CartonStock record);

    List<CartonStock> selectAll(@Param(value = "cur") int cur,@Param(value ="limit")int limit,@Param(value ="custome")String custome);
    //带条件查询
    List<CartonStock> selectAl(@Param(value = "cur") int cur,@Param(value ="limit")int limit,@Param(value ="orderAccount")String orderAccount,@Param(value ="purchaseSpec")String purchaseSpec,@Param(value ="fluteType")String fluteType,@Param(value ="cartonSize")String cartonSize,@Param(value ="minNum")String minNum,@Param(value ="maxNum")String maxNum);

    CartonStock selectById(@Param(value = "place") String place);

    int updataById(@Param(value = "place") String place,@Param(value ="storgeNum")int storgeNum,@Param(value ="palletNumber") int palletNumber);

    List<CartonStock> select(@Param(value = "q")String q);

    List<CartonStock> selectTopjui(@Param(value = "cur")int cur,@Param(value = "rows") int rows,@Param(value = "sort") String sort,@Param(value = "order") String order,@Param(value = "list") List<ComplexQuery> queryList);

    List<CartonStock> selectTop(@Param(value = "list")List<ComplexQuery> queryList);

    List<CartonStock> findByCustom(@Param(value = "customName")String customName);

    CartonStock findById(@Param(value = "orderAccount") String orderAccount);

    List<CartonStock> selectCs(@Param(value = "cust")String cust);

    List<CartonStock> findByProList();
}