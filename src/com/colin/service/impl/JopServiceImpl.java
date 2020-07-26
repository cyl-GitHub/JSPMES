package com.colin.service.impl;

import com.colin.bean.Jop;
import com.colin.mapper.JopMapper;
import com.colin.service.JopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JopServiceImpl implements JopService {

    @Autowired
    JopMapper jopMapper;

    @Override
    public void addJop(Jop jop) {
        jopMapper.addJop(jop);
    }

    @Override
    public Integer selectJopCount(Integer tId) {

        return jopMapper.selectJopCount(tId);
    }

    @Override
    public List<Jop> selectAllJop(int begin, int pageCount, int tId) {
        return jopMapper.selectAllJop(begin, pageCount, tId);
    }

    @Override
    public void deleteJop(int id) {
        jopMapper.deleteJop(id);
    }

    @Override
    public List<Jop> selectAllJopByTid(int id) {

        return jopMapper.selectAllJopByTid(id);
    }

    @Override
    public void updateProcessNum(int i, int jId) {
        jopMapper.updateProcessNum(i, jId);
    }

}
