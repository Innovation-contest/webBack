package com.fuchuang.service.impl;

import com.fuchuang.mapper.ProductMapper;
import com.fuchuang.pojo.Order;
import com.fuchuang.pojo.Product;
import com.fuchuang.pojo.RealProduct;
import com.fuchuang.pojo.SemiProduct;
import com.fuchuang.service.SplitOrder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SplitOrderImpl implements SplitOrder {
    /**
     *
     * @param order 订单
     * @return 工序list
     */
    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<SemiProduct> split(Order order){
        List<RealProduct> realproducts = order.getProducts();
        List<SemiProduct> semis = new ArrayList<>();
        for(RealProduct realProduct:realproducts){
            Product product=productMapper.selectProductById(realProduct.getProduct_id());
            List<SemiProduct> semiProducts=product.getSemiProducts();
            for(SemiProduct semi:semiProducts){
                for(int i=0;i<realProduct.getProduct_num();i++){
                    try{
                        semis.add(semi.clone());
                    }catch (CloneNotSupportedException e){
                        e.printStackTrace();
                    }
                }
            }
        }
        return semis;
    }

}