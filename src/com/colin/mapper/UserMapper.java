package com.colin.mapper;

import com.colin.bean.User;

import java.util.List;

public interface UserMapper {
    User selectUser(User user);

    void insertUser(User user);


    void changePassword(User userLogin);


    Integer selectUserCount();

    List<User> selectAllUser(int begin, int pageCount);

    void deleteUser(int id);

    User selectUserByName(String name);

    void addUser(User user);

    void updateUser(User user);

}
