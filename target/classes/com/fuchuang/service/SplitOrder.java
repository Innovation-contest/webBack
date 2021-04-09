package com.fuchuang.service;

import com.fasterxml.jackson.databind.node.IntNode;
import com.fuchuang.pojo.Order;
import com.fuchuang.pojo.Product_semi;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface SplitOrder {
    public List<Product_semi> split(Order order);
}