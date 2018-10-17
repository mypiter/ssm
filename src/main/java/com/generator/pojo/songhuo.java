package com.generator.pojo;


/**
 * 送货单实体
 *
 */
public class songhuo {
    private String company_name;//本公司名称
    private String company_address;//本公司地址
    private String company_tel;//本公司电话
    private String fax;//传真
    private String consignee;//收货人
    private String delivery_number;//送货单号
    private String custom_company;//客户公司
    private String consignee_address;//送货地址
    private String deli_time;//配送时间
    private String product_name;//产品名称
    private double carton_price;//订单价
    private int out_num;//配送数量
    private String specifications;//规格
    private double danjia;//单价

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public String getCompany_address() {
        return company_address;
    }

    public void setCompany_address(String company_address) {
        this.company_address = company_address;
    }

    public String getCompany_tel() {
        return company_tel;
    }

    public void setCompany_tel(String company_tel) {
        this.company_tel = company_tel;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }
    public double getDanjia() {
        return danjia;
    }

    public void setDanjia(double danjia) {
        this.danjia = danjia;
    }

    public String getDelivery_number() {
        return delivery_number;
    }

    public void setDelivery_number(String delivery_number) {
        this.delivery_number = delivery_number;
    }

    public String getCustom_company() {
        return custom_company;
    }

    public void setCustom_company(String custom_company) {
        this.custom_company = custom_company;
    }

    public String getConsignee_address() {
        return consignee_address;
    }

    public void setConsignee_address(String consignee_address) {
        this.consignee_address = consignee_address;
    }

    public String getDeli_time() {
        return deli_time;
    }

    public void setDeli_time(String deli_time) {
        this.deli_time = deli_time;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public double getCarton_price() {
        return carton_price;
    }

    public void setCarton_price(double carton_price) {
        this.carton_price = carton_price;
    }

    public int getOut_num() {
        return out_num;
    }

    public void setOut_num(int out_num) {
        this.out_num = out_num;
    }

    public String getSpecifications() {
        return specifications;
    }

    public void setSpecifications(String specifications) {
        this.specifications = specifications;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee;
    }
}
