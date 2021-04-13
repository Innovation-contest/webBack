package com.fuchuang.mapper;

import com.fuchuang.pojo.SemiProduct;

import java.util.List;

public interface SemiProductMapper {
    List<SemiProduct> selectSemiByProductId(int product_id);
}
