package com.fuchuang.mapper;

import com.fuchuang.pojo.RealProduct;

import java.util.List;

public interface RealProductMapper {
    List<RealProduct> findProductById(int order_id);
}
