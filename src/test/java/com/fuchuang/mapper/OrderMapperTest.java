package com.fuchuang.mapper;

import com.fuchuang.pojo.Order;
import com.fuchuang.pojo.RealProduct;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

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
        List<RealProduct> realProducts = realProductMapper.findProductById(1);
        for(RealProduct realProduct:realProducts){
            System.out.println(realProduct.toString());
        }
    }
}
