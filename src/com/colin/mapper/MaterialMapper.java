package com.colin.mapper;


import com.colin.bean.Material;
import com.colin.bean.PM;

import java.util.List;

public interface MaterialMapper {


    Integer selectMaterialCount();

    List<Material> selectAllMaterials(int begin, int pageCount);

    Material selectMaterialByName(String name);

    void deleteMaterial(int id);

    void doAddMaterialNumber(Material material);

    void doAddMaterial(Material material);

    Integer selectMaterialCountByPid(int pId);

    List<Material> selectAllMaterialsByPid(int i, int pageCount, int pId);

    List<PM> selectMaterialIdByPid(int i, int pageCount, int pId);

    List<Material> selectAllMaterialsByMid(Integer mId);

    Material selectMaterialById(int mId);

}
