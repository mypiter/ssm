package com.generator.common;

/**
 * 系统异常工具类，继承RunTimeException
 * autor QT001
 * 2018/7/5
 */
public class SystemException extends RuntimeException{

    public SystemException(String message){
        super(message);
    }
    public SystemException(String message,Throwable cause){
        super(message,cause);
    }
    public static int unAbs(int a) {
        return (a > 0) ? -a : a;
    }

}
