package com.generator.common;

import com.generator.pojo.Admin;

import java.util.List;

/**
 * 账号密码验证工具类
 * autor QT001
 * 2018/7/5
 */
public class UserUtil {
    public static String throwIfBank(String message,String targer){
     if(targer==null||(targer.trim()).length()==0){
         throw  new SystemException(message);
     }
         return message;
    }
    //封装
    public static String $(String message,String targer){
        return throwIfBank(message,targer);
    }

    //字符串数组转int数组
    public static int[] StringToInt(String[] arrs){
        int[] ints = new int[arrs.length];
        for(int i=0;i<arrs.length;i++){
            ints[i] = Integer.parseInt(arrs[i]);
        }
        return ints;
    }
    //对象是否为空
    public static boolean isEmpty(Object str) {
        return (str == null || "".equals(str));
    }
    //判断用户是否已经登录
    public static boolean isLogin(List<Admin> li, Admin admin) {
        boolean flag=true;
        for (int i=0;i<li.size();i++){
            if(li.get(i).getAdminName().equals(admin.getAdminName())){
                flag=false;
            }
        }
        return flag;
    }

    }
