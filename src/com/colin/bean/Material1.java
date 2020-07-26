package com.colin.bean;

public class Material1 {
    private int id;//物料id
    private int pmId;
    private int pId;
    private String mName;//物料名称
    private int number;//物料数量
    private int count;//消耗数量

    public Material1() {
    }

    public Material1(int id, int pmId, int pId, String mName, int number, int count) {
        this.id = id;
        this.pmId = pmId;
        this.pId = pId;
        this.mName = mName;
        this.number = number;
        this.count = count;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getPmId() {
        return pmId;
    }

    public void setPmId(int pmId) {
        this.pmId = pmId;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }
}
