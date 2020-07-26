package com.colin.service;

import com.colin.bean.User;

import java.util.List;

public interface UserService {


    //查询用户的具体信息
    User selectUser(User user);

    //用户注册
    void insertUser(User user);


    //更改用户密码
    void changePassword(User userLogin);


    Integer selectUserCount();

    List<User> selectAllUser(int begin, int pageCount);

    void deleteUser(int id);

    User selectUserByName(String name);

    void addUser(User user);

    void updateUser(User user);
}
