package com.fuchuang.service;

import com.fuchuang.pojo.Order;

import java.util.List;

public interface OrderService {
    List<Order> selectAllOrder();

    Boolean insertOneOrder(Order order);
}
