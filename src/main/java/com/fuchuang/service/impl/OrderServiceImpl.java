package com.fuchuang.service.impl;

import com.fuchuang.mapper.OrderMapper;
import com.fuchuang.mapper.RealProductMapper;
import com.fuchuang.pojo.Order;
import com.fuchuang.pojo.RealProduct;
import com.fuchuang.service.OrderService;
import com.fuchuang.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private RealProductMapper realProductMapper;

    @Autowired
    private ScheduleService scheduleService;

    public List<Order> selectAllOrder() {
        return orderMapper.selectAllOrder();
    }


    @Override
    @Transactional
    public boolean insertOneOrder(Order order) {
            int id=orderMapper.selectMaxId();
            order.setOrder_id(id+1);
            orderMapper.insertOneOrder(order);
            for(RealProduct realProduct:order.getProducts()){
                realProduct.setOrder_id(order.getOrder_id());
            }
            realProductMapper.insertProducts(order.getProducts());
            scheduleService.schedule(orderMapper.selectAllOrder());
            return true;
    }

    @Override
    @Transactional
    public Boolean deleteOrderById(int order_id) {
        try {
            realProductMapper.deleteProductByOrderId(order_id);
            orderMapper.deleteOneOrderById(order_id);
            scheduleService.schedule(orderMapper.selectAllOrder());
        }catch (Exception e){
            return false;
        }
        return true;
    }

    @Override
    @Transactional
    public Boolean updateOrder(Order order) {
        try {
            orderMapper.updataOrderById(order);
            realProductMapper.deleteProductByOrderId(order.getOrder_id());
            for(RealProduct realProduct:order.getProducts()){
                realProduct.setOrder_id(order.getOrder_id());
            }
            realProductMapper.insertProducts(order.getProducts());
            scheduleService.schedule(orderMapper.selectAllOrder());
        }catch (Exception e){
            return false;
        }
        return true;
    }


}
