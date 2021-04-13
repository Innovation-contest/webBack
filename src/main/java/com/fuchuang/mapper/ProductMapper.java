package com.fuchuang.mapper;

import com.fuchuang.pojo.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProductMapper {
    List<Product> selectAllProduct();

    Product selectProductById(int product_id);

}
