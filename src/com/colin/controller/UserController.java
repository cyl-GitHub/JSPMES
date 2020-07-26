package com.colin.controller;

import com.colin.bean.Department;
import com.colin.bean.User;
import com.colin.service.DepartmentService;
import com.colin.service.PermService;
import com.colin.service.UserService;
import com.colin.util.MD5;
import com.colin.util.ParamCheck;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/user")
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    DepartmentService departmentService;
    @Autowired
    PermService permService;

    @RequestMapping(value = "register")
    public String register() {
        return "user/register";
    }

    //  注册
    @RequestMapping(value = "doRegister")
    @ResponseBody
    public Map<String, Object> doRegister(@RequestBody User user, HttpServletRequest request) {

        Boolean b = ParamCheck.ParamCheck(user.getName(), user.getPassword());
        String code = user.getCode();
        Map<String, Object> map = new HashMap<>();

        if (b) {

            String sessionCode = request.getSession().getAttribute("code").toString();
            if (code != null && !"".equals(code) && sessionCode != null && !"".equals(sessionCode) && code.equalsIgnoreCase(sessionCode)) {

                // String stringMD5 = MD5.stringMD5(user.getPassword());
                User userLogin = userService.selectUser(user);
                if (userLogin != null) {
                    map.put("result", "用户已存在");
                    return map;
                } else {
                    user.setPassword(MD5.stringMD5(user.getPassword()));
                    userService.insertUser(user);
                    map.put("result", "success");
                    return map;
                }

            } else {
                map.put("result", "验证码错误");
                return map;
            }

        } else {
            map.put("result", "信息不可为空");
            return map;
        }
    }

    @RequestMapping("login")
    public String login(HttpSession session) {
        //清除session缓存信息
        session.invalidate();
        return "user/login";
    }

    //  登录
    @RequestMapping("/doLogin")
    @ResponseBody
    public Map doLogin(@RequestBody User user, HttpSession session, HttpServletRequest request) {

        Boolean b = ParamCheck.ParamCheck(user.getName(), user.getPassword());

        String code = user.getCode();

        Map<String, Object> map = new HashMap<>();

        if (b) {
            //String code = request.getParameter("code");
            // 验证验证码
            String sessionCode = request.getSession().getAttribute("code").toString();
            //String sessionCode = code;
            if (code != null && !"".equals(code) && sessionCode != null && !"".equals(sessionCode) && code.equalsIgnoreCase(sessionCode)) {

                String stringMD5 = MD5.stringMD5(user.getPassword());
                User userLogin = userService.selectUser(user);
                if (userLogin != null && userLogin.getPassword().equals(stringMD5)) {
                    session.setAttribute("userLogin", userLogin);
                    map.put("result", "success");
                    return map;
                } else {
                    map.put("result", "用户信息错误");
                    return map;
                }

            } else {
                map.put("result", "验证码错误");
                return map;
            }

        } else {
            map.put("result", "信息不可为空");
            return map;
        }
    }

    @RequestMapping(value = "/selectAllUsers")
    public String selectAllUsers(@Param("pageNumber") Integer pageNumber, Model model, HttpSession session) {

        int pageNumber1 = 1;

        if (pageNumber != null)
            pageNumber1 = pageNumber;
        int pageCount = 3;
        int totalPage;

        Integer count = userService.selectUserCount();

        if (count % pageCount == 0) {
            totalPage = count / pageCount;
        } else {
            totalPage = count / pageCount + 1;
        }

        if (pageNumber1 <= 0) {
            pageNumber1 = 1;
        } else if (pageNumber1 > totalPage) {
            pageNumber1 = totalPage;
        }

        if (pageNumber1 < 1) {
            pageNumber1 = 1;
        }
        if (totalPage < 1) {
            totalPage = 1;
        }

        List<User> users = userService.selectAllUser((pageNumber1 - 1) * pageCount, pageCount);


        model.addAttribute("pageNumber", pageNumber1);
        model.addAttribute("users", users);
        model.addAttribute("totalPage", totalPage);


        return "/admin/users";
    }


    //删除用户
    @RequestMapping(value = "/deleteUser")
    public String deleteUser(int id, int pageNumber) {
        permService.deletePerm(id);
        userService.deleteUser(id);

        return "forward:/user/selectAllUsers?pageNumber=" + pageNumber + "";
    }

    @RequestMapping(value = "addUser")
    public String addUser() {
        return "admin/addUser";
    }


    @RequestMapping(value = "updateUser")
    public String updateUser(String name, Model model) {
        User user = userService.selectUserByName(name);
        model.addAttribute("updateUser", user);
        return "admin/updateUser";
    }


    @RequestMapping(value = "/doAddUser")
    @ResponseBody
    public Map doAddUser(@RequestParam(value = "name", required = false) String name,
                         @RequestParam(value = "password", required = false) String password,
                         @RequestParam(value = "position", required = false) String position,
                         @RequestParam(value = "salary", required = false) Integer salary,
                         @RequestParam(value = "department", required = false) String department,
                         @RequestParam(value = "perm", required = false) String perm

    ) throws IOException {

        Map<String, String> map = new HashMap<>();

        if (!ParamCheck.ParamCheck(name, position, department, perm)) {
            map.put("result", "信息不可为空,请检查后重新提交!");
            return map;
        }

        User user = new User();
        user.setName(name);
        user.setPassword(MD5.stringMD5(password));
        user.setPosition(position);
        user.setSalary(salary);

        Department department1 = departmentService.selectDepartmentByName(department);

        if (department1 == null) {
            map.put("result", "部门格式错误");
            return map;
        }

        user.setDepartment(department1);

        userService.addUser(user);

        User user1 = userService.selectUser(user);
        user1.setPerm(perm);
        permService.addPerm(user1);

        map.put("result", "添加成功");
        return map;
    }


    @RequestMapping(value = "selectUserByName")
    public String selectUserByName(Model model, HttpSession session, HttpServletRequest request) {
        String name = request.getParameter("byName");
        int pageNumber1 = 1;
        int totalPage;
        totalPage = 1;
        User user = userService.selectUserByName(name);
        List<User> users = new ArrayList<>();
        users.add(user);
        model.addAttribute("pageNumber", pageNumber1);
        model.addAttribute("users", users);
        model.addAttribute("totalPage", totalPage);

        return "/admin/users";
    }


    //管理员更新用户信息
    @RequestMapping(value = "/doUpdateUser")
    @ResponseBody
    public Map doUpdateUser(@RequestParam(value = "name", required = false) String name,
                            @RequestParam(value = "position", required = false) String position,
                            @RequestParam(value = "salary", required = false) Integer salary,
                            @RequestParam(value = "department", required = false) String department,
                            @RequestParam(value = "perm", required = false) String perm

    ) throws IOException {
        Map<String, String> map = new HashMap<>();
        if (!ParamCheck.ParamCheck(name, position, department, perm)) {
            map.put("result", "信息不可为空,请检查后重新提交!");
            return map;
        }

        User user = userService.selectUserByName(name);
        user.setName(name);
        user.setPosition(position);
        user.setSalary(salary);


        Department department1 = departmentService.selectDepartmentByName(department);

        user.setDepartment(department1);

        userService.updateUser(user);

        user.setPerm(perm);
        permService.updatePerm(user);

        map.put("result", "更新成功");
        return map;
    }


    @RequestMapping(value = "changePasssword1")
    public String changePassword1() {
        return "user/changePassword";
    }

    //修改密码
    @RequestMapping(value = "changePassword")
    @ResponseBody
    public Map changePassword(@RequestParam(value = "password", required = false) String password,
                              @RequestParam(value = "newPassword", required = false) String newPassword, HttpSession session) {
        User userLogin = (User) session.getAttribute("userLogin");
        String stringMD5 = MD5.stringMD5(password);
        Map<String, String> map = new HashMap<>();
        if (userLogin.getPassword().equals(stringMD5)) {
            map.put("result", "success");
            userLogin.setPassword(MD5.stringMD5(newPassword));
            userService.changePassword(userLogin);
            session.setAttribute("userLogin", userLogin);
        } else {
            map.put("result", "原密码错误");
        }
        return map;
    }


    //总页面
    @RequestMapping(value = "userTotalPage")
    public String userTotalPage() {
        return "user/userTotalPage";
    }

    //导航栏
    @RequestMapping(value = "userNavigation")
    public String userNavigation() {
        return "user/userNavigation";
    }

    //用户  我的信息
    @RequestMapping(value = "myInformation")
    public String myInformation(Model model, HttpSession session) {
        User user = (User) session.getAttribute("userLogin");

        DecimalFormat decimalFormat = new DecimalFormat("0.0");//这里有几个0就保留几位，如果小数不足位,会以0补足.
        return "user/myInformation";
    }
}
