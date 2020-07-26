package com.colin.bean;

public class User {
    private int id;
    private String name;
    private String password;
    private String position;//职务
    private Integer salary;
    private Department department;//部门
    private String perm;//权限
    private String code;

    public User() {
    }

    public User(int id, String name, String password, String position, Integer salary, Department department, String perm, String code) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.position = position;
        this.salary = salary;
        this.department = department;
        this.perm = perm;
        this.code = code;
    }

    public User(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getPerm() {
        return perm;
    }

    public void setPerm(String perm) {
        this.perm = perm;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
