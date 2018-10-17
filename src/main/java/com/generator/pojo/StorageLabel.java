package com.generator.pojo;

import java.util.List;

/**
 * 纸板入库标签实体类
 */
public class StorageLabel {
    private String orderAccount;//订单号
    private String customCompany;//客户公司
    private String cartonNumber;//产品型号  客户公司那边的
    private String cartonSpec;//产品规格  客户公司那边的
    private String cartonName;//产品名称
    private String materialScience;//材质
    private String pitType;//楞型
    private String lengthLine;//长度压线
    private String widthLine;//宽度压线
    private String lineType;//压线类型
    private int packNum;//打包数
    private Double cartonLength;
    private Double cartonWidth;
    private Double cartonHeight;
    private Double blankingLength;
    private Double blankingWidth;
    private int orderNum;//订单数
    private int num;//入库数
    private int palletNumber;//托盘数
    private String time;//入库时间
    private String enterContent;//入库备注
    private List<StorageLabel> list;

    public List<StorageLabel> getList() {
        return list;
    }

    public void setList(List<StorageLabel> list) {
        this.list = list;
    }

    public String getOrderAccount() {
        return orderAccount;
    }

    public void setOrderAccount(String orderAccount) {
        this.orderAccount = orderAccount;
    }

    public String getCustomCompany() {
        return customCompany;
    }

    public void setCustomCompany(String customCompany) {
        this.customCompany = customCompany;
    }

    public String getCartonNumber() {
        return cartonNumber;
    }

    public void setCartonNumber(String cartonNumber) {
        this.cartonNumber = cartonNumber;
    }

    public String getCartonSpec() {
        return cartonSpec;
    }

    public void setCartonSpec(String cartonSpec) {
        this.cartonSpec = cartonSpec;
    }

    public String getCartonName() {
        return cartonName;
    }

    public void setCartonName(String cartonName) {
        this.cartonName = cartonName;
    }

    public String getMaterialScience() {
        return materialScience;
    }

    public void setMaterialScience(String materialScience) {
        this.materialScience = materialScience;
    }

    public String getPitType() {
        return pitType;
    }

    public void setPitType(String pitType) {
        this.pitType = pitType;
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

    public String getLineType() {
        return lineType;
    }

    public void setLineType(String lineType) {
        this.lineType = lineType;
    }

    public int getPackNum() {
        return packNum;
    }

    public void setPackNum(int packNum) {
        this.packNum = packNum;
    }

    public Double getCartonLength() {
        return cartonLength;
    }

    public void setCartonLength(Double cartonLength) {
        this.cartonLength = cartonLength;
    }

    public Double getCartonWidth() {
        return cartonWidth;
    }

    public void setCartonWidth(Double cartonWidth) {
        this.cartonWidth = cartonWidth;
    }

    public Double getCartonHeight() {
        return cartonHeight;
    }

    public void setCartonHeight(Double cartonHeight) {
        this.cartonHeight = cartonHeight;
    }

    public Double getBlankingLength() {
        return blankingLength;
    }

    public void setBlankingLength(Double blankingLength) {
        this.blankingLength = blankingLength;
    }

    public Double getBlankingWidth() {
        return blankingWidth;
    }

    public void setBlankingWidth(Double blankingWidth) {
        this.blankingWidth = blankingWidth;
    }

    public int getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getPalletNumber() {
        return palletNumber;
    }

    public void setPalletNumber(int palletNumber) {
        this.palletNumber = palletNumber;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getEnterContent() {
        return enterContent;
    }

    public void setEnterContent(String enterContent) {
        this.enterContent = enterContent;
    }
}
