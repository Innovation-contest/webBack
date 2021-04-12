package com.fuchuang.mapper;

import com.fuchuang.pojo.Order;
import com.fuchuang.pojo.RealProduct;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml","classpath:springmvc-config.xml"})
public class OrderMapperTest {
    @Autowired
    private  OrderMapper orderMapper;

    @Autowired
    private  RealProductMapper realProductMapper;

    @Test
    public void allOrder(){
        List<Order> orders=orderMapper.selectAllOrder();
        for(Order order:orders){
            System.out.println(order.toString());
        }
    }

    @Test
    public void selectone(){
        List<RealProduct> realProducts = realProductMapper.findProductById(3);
        for(RealProduct realProduct:realProducts){
            System.out.println(realProduct.toString());
        }
    }
}
