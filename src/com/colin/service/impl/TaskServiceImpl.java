package com.colin.service.impl;

import com.colin.bean.Task;
import com.colin.mapper.TaskMapper;
import com.colin.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    TaskMapper taskMapper;

    @Override
    public void addTask(Task task) {
        taskMapper.addTask(task);
    }

    @Override
    public Task selectTask(Task task) {

        return taskMapper.selectTask(task);
    }

    @Override
    public Task selectTaskByName(String name) {
        return taskMapper.selectTaskByName(name);
    }

    @Override
    public Integer selectTaskCount(int uid) {
        return taskMapper.selectTaskCount(uid);
    }

    @Override
    public List<Task> selectAllTask(int begin, int pageCount) {
        return taskMapper.selectAllTask(begin, pageCount);
    }

    @Override
    public void deleteTask(int id) {
        taskMapper.deleteTask(id);
    }

    @Override
    public Task selectTaskById(int id) {
        return taskMapper.selectTaskById(id);
    }

    @Override
    public void updateJopNum(int i, int tId) {
        taskMapper.updateJopNum(i, tId);
    }

    @Override
    public void updateEndTime(int fulfillTime, int id) {
        taskMapper.updateEndTime(fulfillTime, id);
    }

    @Override
    public void updateOver(int i, int id) {
        taskMapper.updateOver(i, id);
    }

}
