package com.generator.service.impl;

import com.generator.mapper.CompanyInformationMapper;
import com.generator.pojo.CompanyInformation;
import com.generator.pojo.ComplexQuery;
import com.generator.service.CompanyInformationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CompanyInformationServiceImpl implements CompanyInformationService {
    @Resource
    private CompanyInformationMapper companyInformationMapper;

    @Override
    public List<CompanyInformation> findList(int cur, int rows, List<ComplexQuery> queryList) {
        return companyInformationMapper.findList(cur,rows,queryList);
    }

    @Override
    public List<CompanyInformation> findListAll(List<ComplexQuery> queryList) {
        return companyInformationMapper.findListAll(queryList);
    }

    @Override
    public int addCompanyInformation(CompanyInformation companyInformation) {
        return companyInformationMapper.insertSelective(companyInformation);
    }

    @Override
    public CompanyInformation findById(int id) {
        return companyInformationMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateCompanyInformation(CompanyInformation companyInformation) {
        return companyInformationMapper.updateByPrimaryKeySelective(companyInformation);
    }

    @Override
    public int deleteCompanyInformation(List<CompanyInformation> list) {
        return companyInformationMapper.deleteCompanyInformation(list);
    }

    @Override
    public List<CompanyInformation> select(String q) {
        return companyInformationMapper.select(q);
    }

    @Override
    public List<CompanyInformation> findByIds(int[] coids) {
        return companyInformationMapper.findByIds(coids);
    }

}
