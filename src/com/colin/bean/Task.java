package com.colin.bean;

import java.sql.Timestamp;

//工作
public class Task {
    private int id;
    private String tName;
    private int uid;
    private Timestamp createTime;
    private int startTime;
    private int endTime;
    private int machineNum; //机器数
    private int jopNum; //作业数量
    private int over;//是否结束

    public Task() {
    }

    public Task(int id, String tName, int uid, Timestamp createTime, int startTime, int endTime, int machineNum, int jopNum, int over) {
        this.id = id;
        this.tName = tName;
        this.uid = uid;
        this.createTime = createTime;
        this.startTime = startTime;
        this.endTime = endTime;
        this.machineNum = machineNum;
        this.jopNum = jopNum;
        this.over = over;
    }

    public Task(String tName, int machineNum, int jopNum) {
        this.tName = tName;
        this.machineNum = machineNum;
        this.jopNum = jopNum;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public int getStartTime() {
        return startTime;
    }

    public void setStartTime(int startTime) {
        this.startTime = startTime;
    }

    public int getEndTime() {
        return endTime;
    }

    public void setEndTime(int endTime) {
        this.endTime = endTime;
    }

    public int getMachineNum() {
        return machineNum;
    }

    public void setMachineNum(int machineNum) {
        this.machineNum = machineNum;
    }

    public int getJopNum() {
        return jopNum;
    }

    public void setJopNum(int jopNum) {
        this.jopNum = jopNum;
    }

    public int getOver() {
        return over;
    }

    public void setOver(int over) {
        this.over = over;
    }
}
