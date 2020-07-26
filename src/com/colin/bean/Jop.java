package com.colin.bean;

public class Jop {
    private int id;
    private int tId;//工作id
    private int processNum;//工序数
    private int ranking;//工序顺序


    public Jop() {
    }

    public Jop(int id, int tId, int processNum, int ranking) {
        this.id = id;
        this.tId = tId;
        this.processNum = processNum;
        this.ranking = ranking;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int gettId() {
        return tId;
    }

    public void settId(int tId) {
        this.tId = tId;
    }

    public int getProcessNum() {
        return processNum;
    }

    public void setProcessNum(int processNum) {
        this.processNum = processNum;
    }

    public int getRanking() {
        return ranking;
    }

    public void setRanking(int ranking) {
        this.ranking = ranking;
    }
}
