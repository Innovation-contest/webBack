package com.fuchuang.mapper;

import com.fuchuang.pojo.RealProduct;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RealProductMapper {
    /**
     * 通过订单id查询订单的商品
     * @param order_id 商品id
     * @return 商品list
     */
    List<RealProduct> findProductById(int order_id);

    /**
     * 插入订单内的商品
     * @param realProducts 商品列表
     * @return 是否插入成功
     */
    int insertProducts(List<RealProduct> realProducts);
}
