package com.fuchuang.controller;

import com.fuchuang.pojo.Order;
import com.fuchuang.pojo.Resource;
import com.fuchuang.pojo.ResourceType;
import com.fuchuang.service.OrderService;
import com.fuchuang.service.ResourceService;
import com.fuchuang.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/resources")
@Controller
public class ResourceController {

    @Autowired
    private ResourceService resourceService;

    @Autowired
    private ScheduleService scheduleService;

    @Autowired
    private OrderService orderService;

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
        Boolean status=resourceService.insertResource(resource);
        scheduleService.schedule(orderService.selectAllOrder());
        return status;
    }


    @RequestMapping("/deleteres")
    public Boolean deleteResource(int resource_id){
        Boolean status=resourceService.deleteResouerceById(resource_id);
        scheduleService.schedule(orderService.selectAllOrder());
        return status;
    }



}
