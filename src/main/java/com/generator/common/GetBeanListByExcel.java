package com.generator.common;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Row;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class GetBeanListByExcel {
    /**
     * excel转bean
     * @param filePath excel文件路径
     * @param cellKey excel文件每列对应实体类属性名称数组 如String[] cellKey = {"id","province","city","district","postcode"};
     * @param c 实体类Class
     * @return 根据excel表每行的记录生成的实体类list
     * @throws Exception
     */
    public static <T>List<T> getBeanList(String filePath, String[] cellKey, Class<T> c) throws Exception{
        //创建实体类对象容器
        List<T> beanList = new ArrayList<T>();
        //读取excel文件
        POIFSFileSystem fs=new POIFSFileSystem(new FileInputStream(filePath));
        @SuppressWarnings("resource")
        HSSFWorkbook xlsFile = new HSSFWorkbook(fs);
        HSSFSheet sheet = xlsFile.getSheetAt(0);
        //判断属性列表同excel文件列是否相符，避免数组范围溢出
        if(cellKey.length!=sheet.getRow(0).getLastCellNum()) {
            throw new RuntimeException("传入列名参数不符合条件！");
        }
        //创建属性map
        HashMap<String, String> valueMap = new HashMap<String, String>();
        //遍历excel文件
        for (Row row : sheet) {
            for(int i=0;i<cellKey.length;i++) {
                valueMap.put(cellKey[i], row.getCell(i).getStringCellValue());
            }
            T t = c.newInstance();
            //使用BeanUtils将封装的属性注入对象
            BeanUtils.populate(t, valueMap);
            //将对象添加至容器
            beanList.add(t);
        }
        return beanList;
    }

}
