package com.colin.service;

import com.colin.bean.Material;
import com.colin.bean.PM;

import java.util.List;

public interface MaterialService {


    Integer selectMaterialCount();

    List<Material> selectAllMaterials(int i, int pageCount);

    Material selectMaterialByName(String name);

    void deleteMaterial(int id);

    void doAddMaterialNumber(Material material);

    void doAddMaterial(Material material);

    Integer selectMaterialCountByPid(int pId);


    List<PM> selectMaterialIdByPid(int i, int pageCount, int pId);

    List<Material> selectAllMaterialsByMid(Integer mId);

    Material selectMaterialById(int mId);
}
