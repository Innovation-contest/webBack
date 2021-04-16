package com.fuchuang.controller;

import com.fuchuang.pojo.Order;
import com.fuchuang.pojo.Resource;
import com.fuchuang.service.OrderService;
import com.fuchuang.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jws.WebMethod;
import java.util.List;

@RequestMapping("/orders")
@Controller
public class OrderController {

    @Autowired
    private OrderService orderServiceImpl;

    @Autowired
    private ResourceService resourceServiceImpl;

    @ResponseBody
    @RequestMapping("/getorderlist")
    public List<Order> getAll(){
        List<Order> orders=orderServiceImpl.selectAllOrder();
        return  orders;
    }


    @ResponseBody
    @RequestMapping("/addorder")
    public Boolean addOrder(@RequestParam Order order){
        Boolean status=orderServiceImpl.insertOneOrder(order);
        return status;
    }


    @ResponseBody
    @RequestMapping(value = "/updateorder")
    public Boolean updateorder(@RequestParam Order order){
        Boolean status=orderServiceImpl.updateOrder(order);
        return status;
    }


    @ResponseBody
    @RequestMapping("/delorder")
    public Boolean delete_order(@RequestParam int order_id){
        Boolean status=orderServiceImpl.deleteOrderById(order_id);
        return status;
    }


}
