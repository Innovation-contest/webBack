package com.fuchuang.controller;

import com.fuchuang.pojo.Order;
import org.apache.ibatis.annotations.ResultMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class loginController {

    @RequestMapping("/getorders")
    public List<Order> getAll(){
        return null;
    }

}
