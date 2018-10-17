package com.generator.service.impl;

import com.generator.mapper.CartonFormulaMapper;
import com.generator.pojo.CartonFormula;
import com.generator.pojo.ComplexQuery;
import com.generator.service.CartonFormulaService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CartonFormulaServiceImpl implements CartonFormulaService {
    @Resource
    private CartonFormulaMapper cartonFormulaMapper;

    @Override
    public int addCartonFormula(CartonFormula cartonFormula) {
        return cartonFormulaMapper.insertSelective(cartonFormula);
    }

    @Override
    public List<CartonFormula> dropSelectCarton(String q) {
        return cartonFormulaMapper.dropSelectCarton(q);
    }

    @Override
    public CartonFormula findFormula(Integer integer) {
        return cartonFormulaMapper.findFormula(integer);
    }

    @Override
    public List<CartonFormula> findCartonFor(int cur, int rows, String sort, String order, List<ComplexQuery> queryList) {
        return cartonFormulaMapper.findCartonFor(cur,rows,sort,order,queryList);
    }

    @Override
    public List<CartonFormula> findCartonForAll(List<ComplexQuery> queryList) {
        return cartonFormulaMapper.findCartonForAll(queryList);
    }

    @Override
    public int updateCartonFormula(CartonFormula cartonFormula) {
        return cartonFormulaMapper.updateByPrimaryKeySelective(cartonFormula);
    }

    @Override
    public int deleteBatch(List<CartonFormula> list) {
        return cartonFormulaMapper.deleteBatch(list);
    }
}
