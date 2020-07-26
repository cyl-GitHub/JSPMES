package com.colin.controller;

import com.colin.bean.Material;
import com.colin.bean.PM;
import com.colin.bean.User;
import com.colin.service.JopService;
import com.colin.service.MaterialService;
import com.colin.service.ProcessService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.colin.bean.Process;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/process")
public class ProcessController {

    @Autowired
    ProcessService processService;


    @Autowired
    JopService jopService;

    @Autowired
    MaterialService materialService;

    @RequestMapping("addProcess")
    public String addProcess(@Param("jId") Integer jId, Model model) {
        model.addAttribute("jId", jId);
        return "/process/addProcess";
    }


    @RequestMapping("doAddProcess")
    @ResponseBody
    public Map doAddProcess(@RequestBody Process process) {
        Map map = new HashMap();
        if (process == null) {
            map.put("result", "数据不可为空");
            return map;
        }
        processService.addProcess(process);
        jopService.updateProcessNum(1, process.getjId());

        map.put("result", "success");
        map.put("jId", process.getjId());
        return map;
    }

    @RequestMapping("selectAllProcesses")
    public String selectAllProcesses(@Param("pageNumber") Integer pageNumber, @Param("jId") Integer jId, Model model, HttpSession session) {

        int pageNumber1 = 1;

        if (pageNumber != null)
            pageNumber1 = pageNumber;
        int pageCount = 3;
        int totalPage;


        Integer count = processService.selectProcessCount(jId);

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

        List<Process> processes = processService.selectAllProcesses((pageNumber1 - 1) * pageCount, pageCount, jId);


        model.addAttribute("pageNumber", pageNumber1);
        model.addAttribute("processes", processes);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("jId", jId);


        return "/process/processes";
    }


    @RequestMapping(value = "/deleteProcess")
    public String deleteProcess(int id, int pageNumber, int jId) {
        processService.deleteProcess(id);
        jopService.updateProcessNum(-1, jId);
        return "forward:/process/selectAllProcesses?pageNumber=" + pageNumber + "&jId=" + jId + "";
    }


    @RequestMapping(value = "/setMaterial")
    public String setMaterial(int pid, Model model) {
        model.addAttribute("pid", pid);
        return "process/setMaterial";
    }


    @RequestMapping(value = "doSetMaterial")
    @ResponseBody
    public Map doSetMaterial(@RequestBody PM pm, HttpSession session) {
        Map map = new HashMap();

        if (pm == null) {
            map.put("result", "信息不可为空");
            return map;
        }

        processService.setMaterial(pm);

        map.put("result", "success");
        map.put("pId", pm.getpId());
        return map;
    }


    @RequestMapping(value = "/deletePm")
    public String deletePm(int pmId, int pageNumber, int pId) {
        processService.deletePm(pmId);
        return "forward:/material/selectAllMaterialsByPid?pId=" + pId + "";
    }

}
