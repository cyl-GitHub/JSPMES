package com.colin.controller;

import com.colin.bean.Jop;
import com.colin.service.JopService;
import com.colin.service.ProcessService;
import com.colin.service.TaskService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/jop")
public class JopController {

    @Autowired
    JopService jopService;

    @Autowired
    TaskService taskService;

    @Autowired
    ProcessService processService;


    @RequestMapping("addJop")
    public String addJop(@Param("id") Integer id, Model model) {
        model.addAttribute("id", id);
        return "/task/addJop";
    }


    @RequestMapping("doAddJop")
    @ResponseBody
    public Map doAddJop(@RequestBody Jop jop) {
        Map map = new HashMap();
        if (jop == null) {
            map.put("result", "数据不可为空");
            return map;
        }
        jopService.addJop(jop);
        taskService.updateJopNum(1, jop.gettId());


        map.put("result", "success");
        map.put("tId", jop.gettId());
        return map;
    }


    @RequestMapping("selectAllJops")
    public String selectAllJops(@Param("pageNumber") Integer pageNumber, @Param("tId") Integer tId, Model model, HttpSession session) {

        int pageNumber1 = 1;

        if (pageNumber != null)
            pageNumber1 = pageNumber;
        int pageCount = 3;
        int totalPage;


        Integer count = jopService.selectJopCount(tId);

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

        List<Jop> jops = jopService.selectAllJop((pageNumber1 - 1) * pageCount, pageCount, tId);


        model.addAttribute("pageNumber", pageNumber1);
        model.addAttribute("jops", jops);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("tId", tId);

        return "/jop/jops";
    }


    @RequestMapping(value = "/deleteJop")
    public String deleteJop(int id, int pageNumber, int tId) {

        // TODO: 2020/7/13  删除作业下的工序
        processService.deleteProcessByJid(id);
        jopService.deleteJop(id);
        taskService.updateJopNum(-1, tId);


        return "forward:/jop/selectAllJops?pageNumber=" + pageNumber + "&tId=" + tId + "";
    }


}
