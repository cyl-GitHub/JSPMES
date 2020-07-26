package com.colin.service.impl;

import com.colin.bean.Department;
import com.colin.mapper.AdminMapper;
import com.colin.mapper.DepartmentMapper;
import com.colin.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    DepartmentMapper departmentMapper;

    @Override
    public Department selectDepartmentByName(String department) {
        return departmentMapper.selectDepartmentByName(department);
    }

    @Override
    public List<Department> selectAllDepartment() {

        return departmentMapper.selectAllDepartment();
    }
}
