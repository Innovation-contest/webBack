package com.fuchuang.controller;

import com.fuchuang.pojo.Order;
import com.fuchuang.pojo.Resource;
import com.fuchuang.service.OrderService;
import com.fuchuang.service.ResourceService;
import com.fuchuang.util.Result;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.jws.WebMethod;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@RequestMapping("/orders")
@CrossOrigin
@Controller
public class OrderController {

    @Autowired
    private OrderService orderServiceImpl;

    @Autowired
    private ResourceService resourceServiceImpl;

    Result result =new Result();

    @ResponseBody
    @RequestMapping(value = "/getorderlist")
    public List<Order> getAll(){
        List<Order> orders=orderServiceImpl.selectAllOrder();
        return  orders;
    }


    @ResponseBody
    @RequestMapping(value = "/addorder",method = RequestMethod.POST)
    public Result addOrder(@RequestBody(required=true) Order order){
        Boolean status=orderServiceImpl.insertOneOrder(order);
        if(status){
            result.setStatus(1);
        }else {
            result.setStatus(0);
        }
        return result;
    }


    @ResponseBody
    @RequestMapping(value = "/updateorder",method = RequestMethod.POST)
    public Result updateorder(@RequestBody Order order){
        Boolean status=orderServiceImpl.updateOrder(order);
        if(status){
            result.setStatus(1);
        }else{
            result.setStatus(0);
        }
        return result;
    }


    @ResponseBody
    @RequestMapping(value = "/delorder",method = RequestMethod.POST)
    public Result delete_order(@RequestBody Map<String,Integer> order){
        Boolean status=orderServiceImpl.deleteOrderById(order.get("order_id"));
        if(status){
            result.setStatus(1);
        }else{
            result.setStatus(0);
        }
        return result;
    }


}
