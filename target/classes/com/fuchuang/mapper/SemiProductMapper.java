package com.fuchuang.mapper;

import com.fuchuang.pojo.SemiProduct;

import java.util.List;

public interface SemiProductMapper {
    /**
     * 根据商品id查询它的半成品
     * @param product_id 商品id
     * @return 半成品list
     */
    List<SemiProduct> selectSemiByProductId(int product_id);
}
