package com.fuchuang.service;

import com.fuchuang.pojo.Order;
import com.fuchuang.pojo.SemiProduct;

import java.util.List;

public interface SplitOrder {
    public List<SemiProduct> split(Order order);
}