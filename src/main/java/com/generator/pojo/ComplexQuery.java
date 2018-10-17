package com.generator.pojo;

/**
 * topjui组合查询实体类
 */
public class ComplexQuery {
    private String join;//开始条件  and   or
    private String lb;//左括号     (       ''
    private String field;//字段名称
    private String op;//条件  contains=包含  equal=等于   notequal=不等于
    // greater=大于  greaterorequal=大于或等于  less=小于   lessorequal=小于或等于  beginwith=以什么开头   endwith=以什么结尾
    private String value;//数值
    private String rb;//右括号

    public String getJoin() {
        return join;
    }

    public void setJoin(String join) {
        this.join = join;
    }

    public String getLb() {
        return lb;
    }

    public void setLb(String lb) {
        this.lb = lb;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getOp() {
        return op;
    }

    public void setOp(String op) {
        this.op = op;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getRb() {
        return rb;
    }

    public void setRb(String rb) {
        this.rb = rb;
    }
}
