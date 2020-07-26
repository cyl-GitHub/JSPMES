package com.colin.bean;

public class Process {
    private int id;//工序编号
    private int jId;//作业编号
    private int mId;//机器编号
    private int time;//加工用时
    private int starttime;//开始时间
    private int endtime;//结束时间
    private int ranking;//工序排序

    public Process() {
    }

    public Process(int id, int jId, int mId, int time, int starttime, int endtime, int ranking) {
        this.id = id;
        this.jId = jId;
        this.mId = mId;
        this.time = time;
        this.starttime = starttime;
        this.endtime = endtime;
        this.ranking = ranking;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getjId() {
        return jId;
    }

    public void setjId(int jId) {
        this.jId = jId;
    }

    public int getmId() {
        return mId;
    }

    public void setmId(int mId) {
        this.mId = mId;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public int getStarttime() {
        return starttime;
    }

    public void setStarttime(int starttime) {
        this.starttime = starttime;
    }

    public int getEndtime() {
        return endtime;
    }

    public void setEndtime(int endtime) {
        this.endtime = endtime;
    }

    public int getRanking() {
        return ranking;
    }

    public void setRanking(int ranking) {
        this.ranking = ranking;
    }
}
