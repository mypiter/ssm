package com.generator.service.impl;

import com.generator.mapper.ReceivingAddressMapper;
import com.generator.pojo.ReceivingAddress;
import com.generator.service.ReceivingAddressService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ReceivingAddressServiceImpl implements ReceivingAddressService {
    @Resource
    private ReceivingAddressMapper receivingAddressMapper;

    @Override
    public int addS(List<ReceivingAddress> list) {
        return receivingAddressMapper.addS(list);
    }

    @Override
    public List<ReceivingAddress> findByCusId(int cur, int rows, String customId) {
        return receivingAddressMapper.findByCusId(cur,rows,customId);
    }

    @Override
    public List<ReceivingAddress> findByCusIdAll(String customId) {
        return receivingAddressMapper.findByCusIdAll(customId);
    }

    @Override
    public int addReceivingAddr(ReceivingAddress receivingAddress) {
        return receivingAddressMapper.insert(receivingAddress);
    }

    @Override
    public int updateReceivingAdderss(ReceivingAddress receivingAddress) {
        return receivingAddressMapper.updateByPrimaryKeySelective(receivingAddress);
    }

    @Override
    public int deleteReceivingAdderss(List<ReceivingAddress> list) {
        return receivingAddressMapper.deleteReceivingAdderss(list);
    }
}
