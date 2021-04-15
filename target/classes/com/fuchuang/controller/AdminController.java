package com.fuchuang.controller;

import com.fuchuang.mapper.OrderMapper;
import com.fuchuang.pojo.Order;
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
    private OrderMapper orderMapper;

    @ResponseBody
    @RequestMapping("/getorderlist")
    public List<Order> getAll(){
        List<Order> orders=orderMapper.selectAllOrder();
        return  orders;
    }


    @ResponseBody
    @RequestMapping("/addorder")
    public Boolean addOrder(@RequestParam Order order){
        Boolean status=orderMapper.insertOneOrder(order);
        return status;
    }




}
