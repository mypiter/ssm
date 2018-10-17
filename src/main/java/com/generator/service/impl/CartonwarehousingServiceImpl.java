package com.generator.service.impl;
import com.generator.mapper.CartonwarehousingMapper;
import com.generator.pojo.CartonOutInfo;
import com.generator.pojo.Cartonwarehousing;
import com.generator.pojo.StorageLabel;
import com.generator.service.CartonwarehousingService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CartonwarehousingServiceImpl implements CartonwarehousingService {

    @Resource
    CartonwarehousingMapper cartonwarehousingMapper;


    @Override
    public List<Cartonwarehousing> selectById(int id) {
        return null;
    }

    @Override
    public int addCh(Cartonwarehousing ch) {
        int num=cartonwarehousingMapper.insertSelective(ch);
        return num;
    }

    @Override
    public int updataCh(Cartonwarehousing ch) {
        return 0;
    }

    @Override
    public int deleteCh(int id) {
        return 0;
    }

    @Override
    public List<Cartonwarehousing> selectByRu(String orderAccount) {
        return cartonwarehousingMapper.selectByRu(orderAccount);
    }

    @Override
    public Cartonwarehousing findByMaxAccount(String time) {
        return cartonwarehousingMapper.findByMaxAccount(time);
    }

    @Override
    public List<Cartonwarehousing> getListByPurId(int[] rk) {
        return cartonwarehousingMapper.getListByPurId(rk);
    }
}
