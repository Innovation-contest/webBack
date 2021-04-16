package com.fuchuang.service.impl;

import com.fuchuang.mapper.DistriProcessMapper;
import com.fuchuang.mapper.ResourceMapper;
import com.fuchuang.pojo.Resource;
import com.fuchuang.pojo.ResourceType;
import com.fuchuang.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class ResourceServiceImpl implements ResourceService {

    @Autowired
    private ResourceMapper resourceMapper;

    @Autowired
    private DistriProcessMapper distriProcessMapper;

    @Override
    public List<Resource> selectAllResource() {
        return resourceMapper.selectAllResource();
    }

    @Override
    public Boolean insertResource(Resource resource) {
        return resourceMapper.insertResource(resource);
    }

    @Override
    public Boolean deleteResouerceById(int resource_id) {
        try{
            distriProcessMapper.deleteBYResourceId(resource_id);
            resourceMapper.deleteResource(resource_id);
        }catch (Exception e){
            return false;
        }
        return true;
    }

    @Override
    public List<ResourceType> selectResourceByType() {
        List<String> workspaces=new ArrayList<>();
        List<String> types=new ArrayList<>();
        List<ResourceType> resourceTypes=new ArrayList<>();
        workspaces.add("加工");
        workspaces.add("装配");
        types.add("机床");
        types.add("高级机床");
        types.add("人员");
        types.add("高级人员");
        types.add("设备");
        types.add("高级设备");
        for(String w:workspaces){
            for (String t:types){
                ResourceType resourceType=resourceMapper.selectResourceType(w,t);
                if(resourceType.getAmount()!=0){
                    resourceTypes.add(resourceType);
                }
            }
        }
        return  resourceTypes;
    }


}
