package com.generator.pojo;

/**
 * 接收采购单价和供应商材质的实体类
 */
public class Pur_price {
    private double price;//计算出的单价
    private String material;//计算出的供应商材质

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }
}
