package com.colin.service.impl;

import com.colin.bean.User;
import com.colin.mapper.PermMapper;
import com.colin.service.PermService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PermServiceImpl implements PermService {

    @Autowired
    PermMapper permMapper;

    @Override
    public void addPerm(User user) {
        permMapper.addPerm(user);
    }

    @Override
    public void updatePerm(User user) {
        permMapper.updatePerm(user);
    }

    @Override
    public void deletePerm(int uid) {
        permMapper.deletePerm(uid);
    }
}
