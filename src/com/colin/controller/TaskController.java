package com.colin.controller;

import com.colin.bean.*;
import com.colin.bean.Process;
import com.colin.service.JopService;
import com.colin.service.MaterialService;
import com.colin.service.ProcessService;
import com.colin.service.TaskService;
import com.colin.util.GeneticAlgorithm;
import com.colin.util.Result;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/task")
public class TaskController {

    @Autowired
    TaskService taskService;

    @Autowired
    JopService jopService;

    @Autowired
    ProcessService processService;

    @Autowired
    MaterialService materialService;


    @RequestMapping(value = "addTask")
    public String addTask() {
        return "task/addTask";
    }


    @RequestMapping(value = "doAddTask")
    @ResponseBody
    public Map doAddTask(@RequestBody Task task, HttpSession session) {
        Map map = new HashMap();

        if (task == null) {
            map.put("result", "信息不可为空");
            return map;
        }

        Task task1 = taskService.selectTaskByName(task.gettName());

        if (task1 != null) {
            map.put("result", "工作名已存在,请更换!");
            return map;
        }

        User user = (User) session.getAttribute("userLogin");
        task.setUid(user.getId());
        taskService.addTask(task);
        Task task2 = taskService.selectTaskByName(task.gettName());
        session.setAttribute("task", task2);
        map.put("result", "success");
        return map;
    }


    @RequestMapping(value = "/selectAllTasks")
    public String selectAllTasks(@Param("pageNumber") Integer pageNumber, Model model, HttpSession session) {

        int pageNumber1 = 1;

        if (pageNumber != null)
            pageNumber1 = pageNumber;
        int pageCount = 3;
        int totalPage;


        User user = (User) session.getAttribute("userLogin");


        Integer count = taskService.selectTaskCount(user.getId());

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

        List<Task> tasks = taskService.selectAllTask((pageNumber1 - 1) * pageCount, pageCount);


        model.addAttribute("pageNumber", pageNumber1);
        model.addAttribute("tasks", tasks);
        model.addAttribute("totalPage", totalPage);


        return "/task/tasks";
    }


    @RequestMapping(value = "selectTaskByName")
    public String selectUserByName(Model model, HttpServletRequest request) {
        String name = request.getParameter("byName");
        int pageNumber1 = 1;
        int totalPage;
        totalPage = 1;
        Task task = taskService.selectTaskByName(name);
        List<Task> tasks = new ArrayList<>();
        tasks.add(task);
        model.addAttribute("pageNumber", pageNumber1);
        model.addAttribute("tasks", tasks);
        model.addAttribute("totalPage", totalPage);

        return "/task/tasks";
    }


    @RequestMapping(value = "/deleteTask")
    public String deleteTask(int id, int pageNumber) {
        taskService.deleteTask(id);
        // TODO: 2020/7/13  删除任务下的分支
        return "forward:/task/selectAllTasks?pageNumber=" + pageNumber + "";
    }


    @RequestMapping(value = "/taskResult")
    public String taskResult(int id, Model model) {
        Task task = taskService.selectTaskById(id);

        if (task.getJopNum() == 0) {
            return "/result/result2";
        }


        if (task.getOver() == 1) {
            return "forward:/task/showResult?tId=" + task.getId() + "&mId=0";
        }

        List<Jop> jops = jopService.selectAllJopByTid(id);
        List<List<Integer[]>> jops1 = new ArrayList<>();

        List<List<Integer>> processId = new ArrayList<>();

        for (Jop j : jops) {
            if (j.getProcessNum() == 0) {
                return "/result/result2";
            }

            List<Integer[]> integers = new ArrayList<>();
            List<Integer> processI = new ArrayList<>();

            List<Process> processes = processService.selectAllProcessesByJid(j.getId());


            for (Process p : processes
            ) {
                integers.add(new Integer[]{p.getmId(), p.getTime()});
                processI.add(p.getId());
            }
            jops1.add(integers);
            processId.add(processI);
        }


        //储存需要的每一种物料的总数量
        Map<Integer, Integer> map = new HashMap();
        for (List<Integer> pros : processId
        ) {
            for (Integer pro : pros
            ) {
                List<PM> pm = processService.selectPmByPId(pro);

                if (pm == null) {
                    return "/result/result2";
                }

                for (PM p : pm
                ) {
                    Integer integer = map.get(p.getmId());
                    if (integer == null) {
                        map.put(p.getmId(), p.getCount());
                    } else {
                        map.put(p.getmId(), p.getCount() + integer);
                    }
                }
            }
        }


        Map<Integer, Integer> mapHave = new HashMap();
        for (Integer key : map.keySet()
        ) {
            Material material = materialService.selectMaterialById(key);
            mapHave.put(key, material.getNumber());
        }

        Boolean flag = true;
        List<Material> need = new ArrayList<>();
        for (Integer key : map.keySet()
        ) {
            if (map.get(key) > mapHave.get(key)) {
                flag = false;
                need.add(materialService.selectMaterialById(key));
            }
        }

        if (!flag) {
            model.addAttribute("need", need);
            return "/result/result1";
        } else {

            for (Integer key : map.keySet()
            ) {
                materialService.doAddMaterialNumber(new Material(key, -map.get(key)));
            }
        }


        GeneticAlgorithm ga = new GeneticAlgorithm(task.getJopNum(), task.getMachineNum());
        Result result = ga.run(jops1);
        //工序数
        int processNumber = ga.getProcessNumber();
        //机器矩阵
        int[][] machineMatrix = ga.getMachineMatrix();
        //输出最短加工时间

        //设置工作最短运行时间
        taskService.updateEndTime(result.fulfillTime, id);


        for (int i = 0; i < task.getJopNum(); i++) {
            for (int j = 0; j < processNumber; j++) {
                if (machineMatrix[i][j] != -1) {
                    processService.updateProcessSE(processId.get(i).get(j), result.startTime[i][j], result.endTime[i][j]);
                }
            }
        }
        taskService.updateOver(1, id);

        return "forward:/task/showResult?tId=" + task.getId() + "&mId=0";
    }


    @RequestMapping(value = "/showResult")
    public String showResult(Integer mId, int tId, Model model, HttpServletRequest request) {

        if (mId == null) {
            mId = Integer.valueOf(request.getParameter("id"));
        }
        Task task = taskService.selectTaskById(tId);
        List<Process> processes = new ArrayList<>();

        List<Jop> jops = jopService.selectAllJopByTid(tId);

        for (Jop j : jops) {
            List<Process> processes1 = processService.selectAllProcessesByJid(j.getId());

            for (Process p : processes1
            ) {
                if (p.getmId() == mId) {
                    processes.add(p);
                }
            }
        }

        List<String> jopNames = new ArrayList<>();
        for (int i = 0; i < task.getJopNum(); i++) {
            jopNames.add("作业" + i);
        }


        model.addAttribute("mId", mId);
        model.addAttribute("task", task);
        model.addAttribute("jopNames", jopNames);
        model.addAttribute("processes", processes);
        return "/result/result";
    }


}
