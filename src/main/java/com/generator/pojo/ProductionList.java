package com.generator.pojo;

/**
 * 生产单列表实体类
 */
public class ProductionList {
    private int id;
    private String orderAccount;//订单号
    private String staffId;//业务员名称
    private String customName;//客户名称
    private String cartonName;//产品名称
    private double cartonLength;//长
    private double cartonWidth;//宽
    private double cartonHeight;//高
    private int orderNum;//订单数量
    private String materialScience;//材质
    private String pitType;//楞型
    private double blankingLength;//纸板长
    private double blankingWidth;//纸板宽
    private String lengthLine;//长度压线
    private String widthLine;//宽度压线
    private int numberOfSpareParts;//备料数
    private String deliveryTime;//交货时间
    private String workingProcedure;//工序
    private String remarks;//备注
    private String state;//状态1为待纸板 2为已到料
    private int stockNum;//库存数
    private int outNum;//出库数
    private String n;//借调数
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public String getOrderAccount() {
        return orderAccount;
    }

    public void setOrderAccount(String orderAccount) {
        this.orderAccount = orderAccount;
    }

    public String getPitType() {
        return pitType;
    }

    public void setPitType(String pitType) {
        this.pitType = pitType;
    }

    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }

    public String getCustomName() {
        return customName;
    }

    public void setCustomName(String customName) {
        this.customName = customName;
    }

    public String getCartonName() {
        return cartonName;
    }

    public void setCartonName(String cartonName) {
        this.cartonName = cartonName;
    }

    public double getCartonLength() {
        return cartonLength;
    }

    public void setCartonLength(double cartonLength) {
        this.cartonLength = cartonLength;
    }

    public double getCartonWidth() {
        return cartonWidth;
    }

    public void setCartonWidth(double cartonWidth) {
        this.cartonWidth = cartonWidth;
    }

    public double getCartonHeight() {
        return cartonHeight;
    }

    public void setCartonHeight(double cartonHeight) {
        this.cartonHeight = cartonHeight;
    }

    public int getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }

    public String getMaterialScience() {
        return materialScience;
    }

    public void setMaterialScience(String materialScience) {
        this.materialScience = materialScience;
    }

    public double getBlankingLength() {
        return blankingLength;
    }

    public void setBlankingLength(double blankingLength) {
        this.blankingLength = blankingLength;
    }

    public double getBlankingWidth() {
        return blankingWidth;
    }

    public void setBlankingWidth(double blankingWidth) {
        this.blankingWidth = blankingWidth;
    }

    public String getLengthLine() {
        return lengthLine;
    }

    public void setLengthLine(String lengthLine) {
        this.lengthLine = lengthLine;
    }

    public String getWidthLine() {
        return widthLine;
    }

    public void setWidthLine(String widthLine) {
        this.widthLine = widthLine;
    }

    public int getNumberOfSpareParts() {
        return numberOfSpareParts;
    }

    public void setNumberOfSpareParts(int numberOfSpareParts) {
        this.numberOfSpareParts = numberOfSpareParts;
    }

    public String getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(String deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public String getWorkingProcedure() {
        return workingProcedure;
    }

    public void setWorkingProcedure(String workingProcedure) {
        this.workingProcedure = workingProcedure;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getStockNum() {
        return stockNum;
    }

    public void setStockNum(int stockNum) {
        this.stockNum = stockNum;
    }

    public int getOutNum() {
        return outNum;
    }

    public void setOutNum(int outNum) {
        this.outNum = outNum;
    }

    public String getN() {
        return n;
    }

    public void setN(String n) {
        this.n = n;
    }
}
