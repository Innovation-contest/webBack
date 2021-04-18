package com.fuchuang.service;


import com.fuchuang.mapper.OrderMapper;
import com.fuchuang.pojo.Order;
import com.fuchuang.pojo.Resource;
import com.fuchuang.pojo.ResourceType;
import com.fuchuang.pojo.SemiProduct;
import com.fuchuang.service.impl.SplitOrderImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml","classpath:springmvc-config.xml"})
public class TestService {
    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private SplitOrder splitOrder;

    @Autowired
    private ResourceService resourceService;

    @Autowired
    private ScheduleService scheduleService;

    @Test
    public void test_service(){
        Order order = orderMapper.selectOrderById(1);
        List<SemiProduct> semiProducts = splitOrder.split(order);
        for(SemiProduct semiProduct:semiProducts){
            System.out.println(semiProduct.toString());
        }
        System.out.println(semiProducts.size());
    }


    @Test
    public void test_type(){
        List<ResourceType> resourceTypes =new ArrayList<>();
        resourceTypes=resourceService.selectResourceByType();
        for(ResourceType resourceType:resourceTypes){
            System.out.println(resourceType.toString());
        }
    }


    @Test
    public void test_sch(){
        Order order = orderMapper.selectOrderById(1);
        List<Order> orders = new ArrayList<>();
        orders.add(order);
        List<Resource> resources=scheduleService.schedule(orders);
        for(Resource resource:resources){
            System.out.println(resource.toString());
        }
    }

    @Test
    public void te(){
        label:
        for(int i=1;i<10;i++){
            System.out.println(i);
            continue label;
        }
    }
}
