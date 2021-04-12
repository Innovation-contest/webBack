package com.fuchuang.mapper;

import com.fuchuang.pojo.RealProduct;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RealProductMapper {
    List<RealProduct> findProductById(int order_id);
}
