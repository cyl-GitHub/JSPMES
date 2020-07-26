package com.colin.mapper;

import com.colin.bean.Task;

import java.util.List;

public interface TaskMapper {


    void addTask(Task task);

    Task selectTask(Task task);

    Task selectTaskByName(String name);

    Integer selectTaskCount(int uid);

    List<Task> selectAllTask(int begin, int pageCount);

    void deleteTask(int id);

    Task selectTaskById(int id);

    void updateJopNum(int i, int tId);

    void updateEndTime(int fulfillTime, int id);

    void updateOver(int i, int id);
}
