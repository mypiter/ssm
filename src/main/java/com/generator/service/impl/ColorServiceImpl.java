package com.generator.service.impl;

import com.generator.mapper.ColorMapper;
import com.generator.pojo.Color;
import com.generator.service.ColorService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ColorServiceImpl implements ColorService {
    @Resource
    ColorMapper colorMapper;

    @Override
    public List<Color> select() {
        return colorMapper.select();
    }

    @Override
    public int addColor(Color color) {
        return colorMapper.insertSelective(color);
    }

    @Override
    public List<Color> selectByColor(String color) {
        return colorMapper.selectByColor(color);
    }
}
