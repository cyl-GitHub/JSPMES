package com.colin.service;

import com.colin.bean.Department;

import java.util.List;

public interface DepartmentService {


    Department selectDepartmentByName(String department);

    List<Department> selectAllDepartment();

}
