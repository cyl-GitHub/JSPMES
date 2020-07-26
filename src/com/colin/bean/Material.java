package com.colin.bean;

public class Material {
    private int id;//物料id
    private String mName;//物料名称
    private int number;//物料数量
    private int count;//添加数量

    public Material() {
    }

    public Material(int id, String mName, int number, int count) {
        this.id = id;
        this.mName = mName;
        this.number = number;
        this.count = count;
    }

    public Material(int id, int count) {
        this.id = id;
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
}
