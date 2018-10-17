package com.generator.pojo;

/**
 * 客户收货地址实体类
 */
public class ReceivingAddress {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column receiving_address.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column receiving_address.custom_id
     *
     * @mbggenerated
     */
    private Integer customId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column receiving_address.receiving_address
     *
     * @mbggenerated
     */
    private String receivingAddress;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column receiving_address.route
     *
     * @mbggenerated
     */
    private String route;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column receiving_address.consignee
     *
     * @mbggenerated
     */
    private String consignee;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column receiving_address.consignee_tel
     *
     * @mbggenerated
     */
    private String consigneeTel;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column receiving_address.fake
     *
     * @mbggenerated
     */
    private Integer fake;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column receiving_address.id
     *
     * @return the value of receiving_address.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column receiving_address.id
     *
     * @param id the value for receiving_address.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column receiving_address.custom_id
     *
     * @return the value of receiving_address.custom_id
     *
     * @mbggenerated
     */
    public Integer getCustomId() {
        return customId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column receiving_address.custom_id
     *
     * @param customId the value for receiving_address.custom_id
     *
     * @mbggenerated
     */
    public void setCustomId(Integer customId) {
        this.customId = customId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column receiving_address.receiving_address
     *
     * @return the value of receiving_address.receiving_address
     *
     * @mbggenerated
     */
    public String getReceivingAddress() {
        return receivingAddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column receiving_address.receiving_address
     *
     * @param receivingAddress the value for receiving_address.receiving_address
     *
     * @mbggenerated
     */
    public void setReceivingAddress(String receivingAddress) {
        this.receivingAddress = receivingAddress == null ? null : receivingAddress.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column receiving_address.route
     *
     * @return the value of receiving_address.route
     *
     * @mbggenerated
     */
    public String getRoute() {
        return route;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column receiving_address.route
     *
     * @param route the value for receiving_address.route
     *
     * @mbggenerated
     */
    public void setRoute(String route) {
        this.route = route == null ? null : route.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column receiving_address.consignee
     *
     * @return the value of receiving_address.consignee
     *
     * @mbggenerated
     */
    public String getConsignee() {
        return consignee;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column receiving_address.consignee
     *
     * @param consignee the value for receiving_address.consignee
     *
     * @mbggenerated
     */
    public void setConsignee(String consignee) {
        this.consignee = consignee == null ? null : consignee.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column receiving_address.consignee_tel
     *
     * @return the value of receiving_address.consignee_tel
     *
     * @mbggenerated
     */
    public String getConsigneeTel() {
        return consigneeTel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column receiving_address.consignee_tel
     *
     * @param consigneeTel the value for receiving_address.consignee_tel
     *
     * @mbggenerated
     */
    public void setConsigneeTel(String consigneeTel) {
        this.consigneeTel = consigneeTel == null ? null : consigneeTel.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column receiving_address.fake
     *
     * @return the value of receiving_address.fake
     *
     * @mbggenerated
     */
    public Integer getFake() {
        return fake;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column receiving_address.fake
     *
     * @param fake the value for receiving_address.fake
     *
     * @mbggenerated
     */
    public void setFake(Integer fake) {
        this.fake = fake;
    }
}