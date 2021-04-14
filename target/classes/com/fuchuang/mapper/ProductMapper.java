package com.fuchuang.mapper;

import com.fuchuang.pojo.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProductMapper {
    /**
     * 查询所有商品
     * @return 商品list
     */
    List<Product> selectAllProduct();

    /**
     * 通过id查询商品
     * @param product_id 商品id
     * @return 商品类，包含商品详情
     */
    Product selectProductById(int product_id);

}
