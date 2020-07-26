package com.colin.service.impl;

import com.colin.bean.PM;
import com.colin.mapper.ProcessMapper;
import com.colin.service.ProcessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.colin.bean.Process;

import java.util.List;

@Service
public class ProcessServiceImpl implements ProcessService {

    @Autowired
    ProcessMapper processMapper;

    @Override
    public void addProcess(Process process) {
        processMapper.addProcess(process);
    }

    @Override
    public Integer selectProcessCount(Integer jId) {
        return processMapper.selectProcessCount(jId);
    }

    @Override
    public List<Process> selectAllProcesses(int begin, int pageCount, Integer jId) {
        return processMapper.selectAllProcesses(begin, pageCount, jId);
    }

    @Override
    public void deleteProcess(int id) {
        processMapper.deleteProcess(id);
    }

    @Override
    public List<Process> selectAllProcessesByJid(int id) {

        return processMapper.selectAllProcessesByJid(id);
    }

    @Override
    public void deleteProcessByJid(int jId) {
        processMapper.deleteProcessByJid(jId);

    }

    @Override
    public void updateProcessSE(Integer pId, int startTime, int endTime) {
        processMapper.updateProcessSE(pId, startTime, endTime);


    }

    @Override
    public void setMaterial(PM pm) {
        processMapper.setMaterial(pm);
    }

    @Override
    public void deletePm(int pmId) {
        processMapper.deletePm(pmId);
    }

    @Override
    public List<PM> selectPmByPId(Integer pro) {
        return processMapper.selectPmByPId(pro);
    }
}
