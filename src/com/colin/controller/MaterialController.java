package com.colin.controller;

import com.colin.bean.Material;
import com.colin.bean.Material1;
import com.colin.bean.PM;
import com.colin.service.MaterialService;
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
@RequestMapping(value = "/material")
public class MaterialController {

    @Autowired
    MaterialService materialService;

    @RequestMapping(value = "selectAllMaterials")
    public String selectAllMaterials(@Param("pageNumber") Integer pageNumber, Model model) {

        int pageNumber1 = 1;

        if (pageNumber != null)
            pageNumber1 = pageNumber;
        int pageCount = 3;
        int totalPage;

        Integer count = materialService.selectMaterialCount();

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

        List<Material> materials = materialService.selectAllMaterials((pageNumber1 - 1) * pageCount, pageCount);


        model.addAttribute("pageNumber", pageNumber1);
        model.addAttribute("materials", materials);
        model.addAttribute("totalPage", totalPage);


        return "/material/materials";
    }


    @RequestMapping(value = "selectAllMaterials1")
    public String selectAllMaterials1(@Param("pageNumber") Integer pageNumber, Model model) {

        int pageNumber1 = 1;

        if (pageNumber != null)
            pageNumber1 = pageNumber;
        int pageCount = 3;
        int totalPage;

        Integer count = materialService.selectMaterialCount();

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

        List<Material> materials = materialService.selectAllMaterials((pageNumber1 - 1) * pageCount, pageCount);


        model.addAttribute("pageNumber", pageNumber1);
        model.addAttribute("materials", materials);
        model.addAttribute("totalPage", totalPage);


        return "/material/materials1";
    }




    @RequestMapping(value = "selectMaterialsByName")
    public String selectMaterialsByName(Model model, HttpServletRequest request) {
        String name = request.getParameter("byName");
        int pageNumber1 = 1;
        int totalPage;
        totalPage = 1;
        Material material = materialService.selectMaterialByName(name);
        List<Material> materials = new ArrayList<>();
        materials.add(material);
        model.addAttribute("pageNumber", pageNumber1);
        model.addAttribute("materials", materials);
        model.addAttribute("totalPage", totalPage);

        return "/material/materials";
    }


    @RequestMapping(value = "selectMaterialsByName1")
    public String selectMaterialsByName1(Model model, HttpServletRequest request) {
        String name = request.getParameter("byName");
        int pageNumber1 = 1;
        int totalPage;
        totalPage = 1;
        Material material = materialService.selectMaterialByName(name);
        List<Material> materials = new ArrayList<>();
        materials.add(material);
        model.addAttribute("pageNumber", pageNumber1);
        model.addAttribute("materials", materials);
        model.addAttribute("totalPage", totalPage);

        return "/material/materials1";
    }


    @RequestMapping(value = "/deleteMaterial")
    public String deleteMaterial(int id, int pageNumber) {
        materialService.deleteMaterial(id);
        return "forward:/material/selectAllMaterials?pageNumber=" + pageNumber + "";
    }


    @RequestMapping(value = "/addMaterialNumber")
    public String addMaterialNumber(int id, Model model) {
        model.addAttribute("mId", id);
        return "material/addMaterialNumber";
    }


    @RequestMapping(value = "/doAddMaterialNumber")
    @ResponseBody
    public Map doAddMaterialNumber(@RequestBody Material material, Model model) {
        Map map = new HashMap();

        if (material.getCount() == 0) {
            map.put("result", "数据不可为空或0");
        }
        materialService.doAddMaterialNumber(material);
        map.put("result", "success");
        return map;
    }


    @RequestMapping("addMaterial")
    public String addMaterial() {
        return "/material/addMaterial";
    }


    @RequestMapping(value = "/doAddMaterial")
    @ResponseBody
    public Map doAddMaterial(@RequestBody Material material, Model model) {
        Map map = new HashMap();

        if (material.getNumber() == 0 || material.getmName() == null) {
            map.put("result", "数据不可为空或0");
        }
        materialService.doAddMaterial(material);
        map.put("result", "success");
        return map;
    }


    @RequestMapping(value = "selectAllMaterialsByPid")
    public String selectAllMaterialsByPid(@Param("pageNumber") Integer pageNumber, @Param("pId") Integer pId, Model model, HttpSession session) {

        int pageNumber1 = 1;

        if (pageNumber != null)
            pageNumber1 = pageNumber;
        int pageCount = 3;
        int totalPage;

        Integer count = materialService.selectMaterialCountByPid(pId);

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

        List<PM> pms = materialService.selectMaterialIdByPid((pageNumber1 - 1) * pageCount, pageCount, pId);

        List<Material1> materials = new ArrayList<>();

        for (PM pm : pms
        ) {
            Material material = materialService.selectMaterialById(pm.getmId());
            Material1 material1 = new Material1(material.getId(), pm.getId(),pm.getpId(), material.getmName(), material.getNumber(), pm.getCount());
            materials.add(material1);
        }


        model.addAttribute("pageNumber", pageNumber1);
        model.addAttribute("materials", materials);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("pId", pId);

        return "/process/materialNeed";
    }


}
