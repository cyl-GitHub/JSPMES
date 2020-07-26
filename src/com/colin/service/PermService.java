package com.colin.service;


import com.colin.bean.User;

public interface PermService {

     void addPerm(User user);

    void updatePerm(User user);

    void deletePerm(int uid);
}
