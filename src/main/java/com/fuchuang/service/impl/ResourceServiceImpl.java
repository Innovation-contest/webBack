package com.fuchuang.service.impl;

import com.fuchuang.mapper.ResourceMapper;
import com.fuchuang.pojo.Resource;
import com.fuchuang.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResourceServiceImpl implements ResourceService {

    @Autowired
    private ResourceMapper resourceMapper;

    @Override
    public List<Resource> selectAllResource() {
        return resourceMapper.selectAllResource();
    }

    @Override
    public Boolean insertResource(Resource resource) {
        return resourceMapper.insertResource(resource);
    }


}
