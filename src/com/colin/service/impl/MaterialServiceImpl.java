package com.colin.service.impl;

import com.colin.bean.Material;
import com.colin.bean.PM;
import com.colin.mapper.MaterialMapper;
import com.colin.service.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MaterialServiceImpl implements MaterialService {

    @Autowired
    MaterialMapper materialMapper;

    @Override
    public Integer selectMaterialCount() {

        return materialMapper.selectMaterialCount();
    }

    @Override
    public List<Material> selectAllMaterials(int begin, int pageCount) {
        return materialMapper.selectAllMaterials(begin, pageCount);
    }

    @Override
    public Material selectMaterialByName(String name) {

        return materialMapper.selectMaterialByName(name);
    }

    @Override
    public void deleteMaterial(int id) {
        materialMapper.deleteMaterial(id);
    }

    @Override
    public void doAddMaterialNumber(Material material) {
        materialMapper.doAddMaterialNumber(material);
    }

    @Override
    public void doAddMaterial(Material material) {
        materialMapper.doAddMaterial(material);
    }

    @Override
    public Integer selectMaterialCountByPid(int pId) {
        return materialMapper.selectMaterialCountByPid(pId);
    }


    @Override
    public List<PM> selectMaterialIdByPid(int i, int pageCount, int pId) {
        return materialMapper.selectMaterialIdByPid(i, pageCount, pId);
    }

    @Override
    public List<Material> selectAllMaterialsByMid(Integer mId) {
        return materialMapper.selectAllMaterialsByMid(mId);
    }

    @Override
    public Material selectMaterialById(int mId) {
        return materialMapper.selectMaterialById(mId);
    }

}
