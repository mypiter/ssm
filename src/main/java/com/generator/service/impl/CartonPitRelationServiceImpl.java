package com.generator.service.impl;

import com.generator.mapper.CartonPitRelationMapper;
import com.generator.pojo.CartonFormula;
import com.generator.pojo.CartonPitRelation;
import com.generator.service.CartonPitRelationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CartonPitRelationServiceImpl implements CartonPitRelationService {
    @Resource
    private CartonPitRelationMapper cartonPitRelationMapper;

    @Override
    public int addRelatinS(List<CartonPitRelation> list) {
        return cartonPitRelationMapper.addRelatinS(list);
    }

    @Override
    public CartonPitRelation findRelation(Integer integer, Integer integer1) {
        return cartonPitRelationMapper.findRelation(integer,integer1);
    }

    @Override
    public List<CartonPitRelation> findByCartonId(int cur, int rows, Integer integer) {
        return cartonPitRelationMapper.findByCartonId(cur,rows,integer);
    }

    @Override
    public List<CartonPitRelation> findByCartonIdAll(Integer integer) {
        return cartonPitRelationMapper.findByCartonIdAll(integer);
    }

    @Override
    public int deleteBatchCarPit(List<CartonFormula> list) {
        return cartonPitRelationMapper.deleteBatchCarPit(list);
    }

    @Override
    public int updateCartonPit(CartonPitRelation cartonPitRelation) {
        return cartonPitRelationMapper.updateByPrimaryKeySelective(cartonPitRelation);
    }

    @Override
    public int deleteByPitId(int i) {
        return cartonPitRelationMapper.deleteByPitId(i);
    }
}
