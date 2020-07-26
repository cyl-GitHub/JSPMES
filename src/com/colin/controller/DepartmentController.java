package com.colin.controller;

import com.colin.bean.Department;
import com.colin.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/department")
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    @RequestMapping(value = "selectAllDepartment")
    @ResponseBody
    public Map selectAllDepartment() {

        List<Department> departments = departmentService.selectAllDepartment();
        Map map = new HashMap();
        map.put("departments", departments);
        return map;
    }

}
