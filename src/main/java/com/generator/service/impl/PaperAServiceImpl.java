package com.generator.service.impl;

import com.generator.mapper.PaperAMapper;
import com.generator.pojo.PaperA;
import com.generator.service.PaperAService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class PaperAServiceImpl implements PaperAService {
    @Resource
    PaperAMapper paperAMapper;
    @Override
    public List<PaperA> selectById(int id,int cur,int rows) {
        List<PaperA> list=new ArrayList<PaperA>();
        list=paperAMapper.selectById(id,cur,rows);
        return list;
    }

    @Override
    public List<PaperA> findAll(int id) {
        return paperAMapper.findAll(id);
    }

    @Override
    public int addPaperA(PaperA paperA) {
        int num=paperAMapper.insert(paperA);
        return num;
    }

    @Override
    public int updatePaperA(PaperA paperA) {
        int num =paperAMapper.updateByPrimaryKeySelective(paperA);
        return num;
    }

    @Override
    public int deletePaperA(int id) {
        int num=paperAMapper.deleteByPrimaryKey(id);
        return num;
    }

    public String selectMyCodeByCo(int supllierId,String code){
        String[] strArr = code.split("");
        String strCode="";
        for(int i = 0;i<strArr.length;i++) {
            String newcode= paperAMapper.findMyCode(supllierId,strArr[i]);
            if(newcode==null){
                return null;
            }
            strCode += newcode;
        }
        return strCode;
     }
}
