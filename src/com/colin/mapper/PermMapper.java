package com.colin.mapper;


import com.colin.bean.User;

public interface PermMapper {


    void addPerm(User user);

    void deletePerm(int uid);

    void updatePerm(User user);

}
