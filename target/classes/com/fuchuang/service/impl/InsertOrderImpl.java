package com.fuchuang.service.impl;

import com.fuchuang.mapper.OrderMapper;
import com.fuchuang.mapper.RealProductMapper;
import com.fuchuang.pojo.Order;
import com.fuchuang.pojo.RealProduct;
import com.fuchuang.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InsertOrderImpl implements com.fuchuang.service.InsertOrder {
    /**
     *
     * @param order 插入的拆分好的订单
     * @return 经过调整后的订单列表
     */
    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private RealProductMapper realProductMapper;

    @Autowired
    private ScheduleService scheduleService;

    @Override
    public List<Order> insertOrder(Order order) {
        orderMapper.insertOneOrder(order);
        List<RealProduct> realProducts = order.getProducts();
        for(RealProduct realProduct:realProducts){
//            realProductMapper.insertOneProduct(realProduct);
        }
        List<Order> orders=orderMapper.selectAllOrder();
        scheduleService.schedule(orders);

        return null;
    }
}
