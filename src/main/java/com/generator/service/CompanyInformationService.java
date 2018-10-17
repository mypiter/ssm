package com.generator.service;

import com.generator.pojo.CompanyInformation;
import com.generator.pojo.ComplexQuery;

import java.util.List;

public interface CompanyInformationService {
    /**
     * 查询列表 分页
     * @param cur
     * @param rows
     * @param queryList
     * @return
     */
    List<CompanyInformation> findList(int cur, int rows, List<ComplexQuery> queryList);

    /**
     * 查询列表 全部
     * @param queryList
     * @return
     */
    List<CompanyInformation> findListAll(List<ComplexQuery> queryList);

    /**
     * 新增公司信息
     * @param companyInformation
     * @return
     */
    int addCompanyInformation(CompanyInformation companyInformation);

    /**
     * 根据id查询公司信息
     * @param id
     * @return
     */
    CompanyInformation findById(int id);

    /**
     * 编辑公司信息
     * @param companyInformation
     * @return
     */
    int updateCompanyInformation(CompanyInformation companyInformation);

    /**
     * 删除公司信息 可批量
     * @param list
     * @return
     */
    int deleteCompanyInformation(List<CompanyInformation> list);

    /**
     * 下拉框进入
     * @param q
     * @return
     */
    List<CompanyInformation> select(String q);
    //批量查询本公司信息
    List<CompanyInformation> findByIds(int[] coids);
}
