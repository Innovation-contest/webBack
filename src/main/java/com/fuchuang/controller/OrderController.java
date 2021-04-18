package com.fuchuang.controller;

import com.fuchuang.pojo.Order;
import com.fuchuang.pojo.Resource;
import com.fuchuang.service.OrderService;
import com.fuchuang.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.jws.WebMethod;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@RequestMapping("/orders")
@Controller
public class OrderController {

    @Autowired
    private OrderService orderServiceImpl;

    @Autowired
    private ResourceService resourceServiceImpl;

    @ResponseBody
    @RequestMapping(value = "/getorderlist",method = RequestMethod.POST)
    public List<Order> getAll(){
        List<Order> orders=orderServiceImpl.selectAllOrder();
        return  orders;
    }


    @ResponseBody
    @RequestMapping(value = "/addorder",method = RequestMethod.POST)
    public Boolean addOrder(@RequestBody(required=true) Order order){
        Order order1=new Order();
//        order1.setOrder_id(order.getIntHeader("order_id"));
//        order1.setEnd_time(order.getIntHeader("order_start_time"));
//        order1.setStart_time(order.getIntHeader("order_end_time"));
//        order1.setOrder_description(order.getParameter("order_description"));
//        System.out.println(order.getParameter("products"));
//        Boolean status=orderServiceImpl.insertOneOrder(order1);
//        return status;
        System.out.println(order.toString());
        return true;
    }


    @ResponseBody
    @RequestMapping(value = "/updateorder",method = RequestMethod.POST)
    public Boolean updateorder(@RequestParam Order order){
        Boolean status=orderServiceImpl.updateOrder(order);
        return status;
    }


    @ResponseBody
    @RequestMapping(value = "/delorder",method = RequestMethod.POST)
    public Boolean delete_order(@RequestParam int order_id){
        Boolean status=orderServiceImpl.deleteOrderById(order_id);
        return status;
    }


}
