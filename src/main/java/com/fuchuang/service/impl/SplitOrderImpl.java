package com.fuchuang.service.impl;

import com.fuchuang.pojo.Order;
import com.fuchuang.pojo.Product;
import com.fuchuang.pojo.SemiProduct;
import com.fuchuang.service.SplitOrder;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class SplitOrderImpl implements SplitOrder {
    /**
     *
     * @param order 订单
     * @return 工序list
     */
    @Override
    public List<SemiProduct> split(Order order){
        List<Product> products = order.getProduct();
        List<SemiProduct> semis = new ArrayList<>();
        for(Product pdt:products){
            semis.addAll(pdt.getSemiproduct());
        }
        return semis;
    }
}
