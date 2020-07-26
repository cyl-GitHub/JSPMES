package com.colin.bean;

public class PM {
    private int id;
    private int pId;
    private int mId;
    private int count;

    public PM() {
    }

    public PM(int id, int pId, int mId, int count) {
        this.id = id;
        this.pId = pId;
        this.mId = mId;
        this.count = count;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public int getmId() {
        return mId;
    }

    public void setmId(int mId) {
        this.mId = mId;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
