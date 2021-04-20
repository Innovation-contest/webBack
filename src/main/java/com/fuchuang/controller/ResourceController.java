package com.fuchuang.controller;

import com.fuchuang.pojo.Order;
import com.fuchuang.pojo.Resource;
import com.fuchuang.pojo.ResourceType;
import com.fuchuang.service.OrderService;
import com.fuchuang.service.ResourceService;
import com.fuchuang.service.ScheduleService;
import com.fuchuang.util.ResourceUtil;
import com.fuchuang.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RequestMapping("/resources")
@CrossOrigin
@Controller
public class ResourceController {

    @Autowired
    private ResourceService resourceService;

    @Autowired
    private ScheduleService scheduleService;

    @Autowired
    private OrderService orderService;

    Result result=new Result();

    @ResponseBody
    @RequestMapping("/getcalender")
    public List<ResourceUtil> selectAllResource(){
        return resourceService.selectAllResource();
    }

    @ResponseBody
    @RequestMapping("/getlist")
    public List<ResourceType> findResourceBytype(){
        return resourceService.selectResourceByType();
    }

    @ResponseBody
    @RequestMapping(value = "/addres",method = RequestMethod.POST)
    public Result addResource(@RequestBody Resource resource){
        Boolean status=resourceService.insertResource(resource);
        scheduleService.schedule(orderService.selectAllOrder());
        if(status){
            result.setStatus(1);
        }else{
            result.setStatus(0);
        }
        return  result;
    }


    @ResponseBody
    @RequestMapping(value = "/deleteres",method = RequestMethod.POST)
    public Result deleteResource(@RequestBody Map<String,Integer> resource){
        int resource_id=resource.get("resource_id");
        Boolean status=resourceService.deleteResouerceById(resource_id);
        scheduleService.schedule(orderService.selectAllOrder());
        if(status){
            result.setStatus(1);
        }else {
            result.setStatus(0);
        }
        return result;
    }



}
