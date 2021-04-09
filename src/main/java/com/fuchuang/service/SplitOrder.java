package com.fuchuang.service;

import com.fuchuang.pojo.Order;
import com.fuchuang.pojo.Product_semi;

import java.util.List;

public interface SplitOrder {
    public List<Product_semi> split(Order order);
}
