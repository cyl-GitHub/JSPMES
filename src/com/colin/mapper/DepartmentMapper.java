package com.colin.mapper;

import com.colin.bean.Admin;
import com.colin.bean.Department;

import java.util.List;

public interface DepartmentMapper {


    Department selectDepartmentByName(String department);

    List<Department> selectAllDepartment();

}
