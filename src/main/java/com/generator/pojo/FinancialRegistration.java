package com.generator.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class FinancialRegistration {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column financial_registration.financial_registration_id
     *
     * @mbggenerated
     */
    private Integer financialRegistrationId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column financial_registration.finance_money
     *
     * @mbggenerated
     */
    private Double financeMoney;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column financial_registration.finance_people
     *
     * @mbggenerated
     */
    private String financePeople;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column financial_registration.finance_register
     *
     * @mbggenerated
     */
    private String financeRegister;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column financial_registration.finance_date
     *
     * @mbggenerated
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date financeDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column financial_registration.finance_price
     *
     * @mbggenerated
     */
    private Double financePrice;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column financial_registration.finance_num
     *
     * @mbggenerated
     */
    private Integer financeNum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column financial_registration.finance_remarks
     *
     * @mbggenerated
     */
    private String financeRemarks;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column financial_registration.fake
     *
     * @mbggenerated
     */
    private Integer fake;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column financial_registration.financial_registration_id
     *
     * @return the value of financial_registration.financial_registration_id
     *
     * @mbggenerated
     */
    public Integer getFinancialRegistrationId() {
        return financialRegistrationId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column financial_registration.financial_registration_id
     *
     * @param financialRegistrationId the value for financial_registration.financial_registration_id
     *
     * @mbggenerated
     */
    public void setFinancialRegistrationId(Integer financialRegistrationId) {
        this.financialRegistrationId = financialRegistrationId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column financial_registration.finance_money
     *
     * @return the value of financial_registration.finance_money
     *
     * @mbggenerated
     */
    public Double getFinanceMoney() {
        return financeMoney;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column financial_registration.finance_money
     *
     * @param financeMoney the value for financial_registration.finance_money
     *
     * @mbggenerated
     */
    public void setFinanceMoney(Double financeMoney) {
        this.financeMoney = financeMoney;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column financial_registration.finance_people
     *
     * @return the value of financial_registration.finance_people
     *
     * @mbggenerated
     */
    public String getFinancePeople() {
        return financePeople;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column financial_registration.finance_people
     *
     * @param financePeople the value for financial_registration.finance_people
     *
     * @mbggenerated
     */
    public void setFinancePeople(String financePeople) {
        this.financePeople = financePeople == null ? null : financePeople.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column financial_registration.finance_register
     *
     * @return the value of financial_registration.finance_register
     *
     * @mbggenerated
     */
    public String getFinanceRegister() {
        return financeRegister;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column financial_registration.finance_register
     *
     * @param financeRegister the value for financial_registration.finance_register
     *
     * @mbggenerated
     */
    public void setFinanceRegister(String financeRegister) {
        this.financeRegister = financeRegister == null ? null : financeRegister.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column financial_registration.finance_date
     *
     * @return the value of financial_registration.finance_date
     *
     * @mbggenerated
     */
    public Date getFinanceDate() {
        return financeDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column financial_registration.finance_date
     *
     * @param financeDate the value for financial_registration.finance_date
     *
     * @mbggenerated
     */
    public void setFinanceDate(Date financeDate) {
        this.financeDate = financeDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column financial_registration.finance_price
     *
     * @return the value of financial_registration.finance_price
     *
     * @mbggenerated
     */
    public Double getFinancePrice() {
        return financePrice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column financial_registration.finance_price
     *
     * @param financePrice the value for financial_registration.finance_price
     *
     * @mbggenerated
     */
    public void setFinancePrice(Double financePrice) {
        this.financePrice = financePrice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column financial_registration.finance_num
     *
     * @return the value of financial_registration.finance_num
     *
     * @mbggenerated
     */
    public Integer getFinanceNum() {
        return financeNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column financial_registration.finance_num
     *
     * @param financeNum the value for financial_registration.finance_num
     *
     * @mbggenerated
     */
    public void setFinanceNum(Integer financeNum) {
        this.financeNum = financeNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column financial_registration.finance_remarks
     *
     * @return the value of financial_registration.finance_remarks
     *
     * @mbggenerated
     */
    public String getFinanceRemarks() {
        return financeRemarks;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column financial_registration.finance_remarks
     *
     * @param financeRemarks the value for financial_registration.finance_remarks
     *
     * @mbggenerated
     */
    public void setFinanceRemarks(String financeRemarks) {
        this.financeRemarks = financeRemarks == null ? null : financeRemarks.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column financial_registration.fake
     *
     * @return the value of financial_registration.fake
     *
     * @mbggenerated
     */
    public Integer getFake() {
        return fake;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column financial_registration.fake
     *
     * @param fake the value for financial_registration.fake
     *
     * @mbggenerated
     */
    public void setFake(Integer fake) {
        this.fake = fake;
    }

}