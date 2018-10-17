package com.generator.service.impl;

import com.generator.mapper.PaperSettingMapper;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.PaperSetting;
import com.generator.service.PaperSetService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PaperSetServiceImpl implements PaperSetService {
    @Resource
    PaperSettingMapper paperSettingMapper;
    @Override
    public int addPaper(PaperSetting paperSetting) {
        int num=paperSettingMapper.insertSelective(paperSetting);
        return num;
    }

    @Override
    public List<PaperSetting> select() {

        return paperSettingMapper.select();
    }

    public List<PaperSetting> findPaperList(int cur, int rows, String sort, String order, List<ComplexQuery> queryList){
        return paperSettingMapper.findPaperList(cur,rows,sort,order,queryList);
    }

    public List<PaperSetting> findPaperListAll(List<ComplexQuery> queryList){
        return paperSettingMapper.findPaperListAll(queryList);
    }
    public PaperSetting selectById(int paperId){
        return paperSettingMapper.selectByPrimaryKey(paperId);
    }
    public int updatePaper(PaperSetting paper){
        return paperSettingMapper.updateByPrimaryKeySelective(paper);
    }

    public int deletePaper(int paperId){
        return paperSettingMapper.deleteByPrimaryKey(paperId);
    }
}
