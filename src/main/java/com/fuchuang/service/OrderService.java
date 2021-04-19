package com.fuchuang.service;

import com.fuchuang.pojo.Order;

import java.util.List;

public interface OrderService {
    List<Order> selectAllOrder();

    boolean insertOneOrder(Order order);

    Boolean deleteOrderById(int order_id);

    Boolean updateOrder(Order order);
}
