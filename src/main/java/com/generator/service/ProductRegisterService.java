package com.generator.service;

import com.generator.pojo.CartonplantModel2;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Place;

import java.util.List;

public interface ProductRegisterService {

    int addProductRegister(CartonplantModel2 cartonplantModel2);

    List<CartonplantModel2> select(int cur, int rows, String sort, String oder, List<ComplexQuery> queryList);

    List<CartonplantModel2> selectAll(List<ComplexQuery> queryList);

    CartonplantModel2 selectById(int cartonId);

    int updateProduct(CartonplantModel2 cartonplantModel2);

    int deleteProduct(int i);

    /**
     * 产品下拉框查询
     * @param q
     * @return
     */
    List<CartonplantModel2> dropSelect(String q);

    /**
     * 查找出有该楞型的产品
     * @param i
     * @return
     */
    List<CartonplantModel2> findByPitId(int i);
}
