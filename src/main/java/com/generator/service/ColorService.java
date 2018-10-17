package com.generator.service;

import com.generator.pojo.Color;

import java.util.List;

public interface ColorService {
    List<Color> select();
    int addColor(Color color);
    List<Color> selectByColor(String color);
}
