package com.fuchuang.service.impl;

import com.fuchuang.pojo.Order;
import com.fuchuang.pojo.SemiProduct;
import com.fuchuang.service.SplitOrder;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class SplitOrderImpl implements SplitOrder {
    /**
     *
     * @param order 订单
     * @return 工序list
     */
    @Override
    public List<SemiProduct> split(Order order){
//        Map<Integer,Integer> products = order.getProducts();
//        List<SemiProduct> product_semis = new ArrayList<>();
//
//        for(int i = 1;i <= 6;i ++){
//            int n = products.getOrDefault(i,-1);
//            if(n != -1){
//                List<SemiProduct> temp = null;
//                //调用product接口得到product-semis
//                product_semis.addAll(temp);
//            }
//        }
//        return product_semis;
        return null;
    }
}
