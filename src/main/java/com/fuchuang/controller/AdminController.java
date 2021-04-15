package com.fuchuang.controller;

import com.fuchuang.mapper.OrderMapper;
import com.fuchuang.pojo.Order;
import com.fuchuang.pojo.Resource;
import com.fuchuang.service.OrderService;
import com.fuchuang.service.ResourceService;
import com.fuchuang.service.impl.OrderServiceImpl;
import com.fuchuang.service.impl.ResourceServiceImpl;
import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("/admin/orders")
@Controller
public class AdminController {

    @Autowired
    private OrderServiceImpl orderService;

    @Autowired
    private ResourceServiceImpl resourceService;

    @ResponseBody
    @RequestMapping("/getorderlist")
    public List<Order> getAll(){
        List<Order> orders=orderService.selectAllOrder();
        return  orders;
    }


    @ResponseBody
    @RequestMapping("/addorder")
    public Boolean addOrder(@RequestParam Order order){
        Boolean status=orderService.insertOneOrder(order);
        return status;
    }

    @ResponseBody
    @RequestMapping("/")
    public List<Resource> scheduleResult(){
        return resourceService.selectAllResource();
    }


}
