package com.fuchuang.controller;

import com.fuchuang.pojo.Resource;
import com.fuchuang.pojo.ResourceType;
import com.fuchuang.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/resources")
@Controller
public class ResourceController {

    @Autowired
    private ResourceService resourceService;


    @RequestMapping("/getcalender")
    public List<Resource> selectAllResource(){
        return resourceService.selectAllResource();
    }

    @RequestMapping("/getlist")
    public List<ResourceType> findResourceBytype(){
        return resourceService.selectResourceByType();
    }

    @RequestMapping("/addres")
    public Boolean addResource(Resource resource){
        return resourceService.insertResource(resource);
    }


    @RequestMapping("/deleteres")
    public Boolean deleteResource(int resource_id){
        return resourceService.deleteResouerceById(resource_id);
    }



}
