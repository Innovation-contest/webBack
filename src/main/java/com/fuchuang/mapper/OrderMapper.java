package com.fuchuang.mapper;

import com.fuchuang.pojo.Order;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {
    List<Order> selectAllOrder();

    Order selectOrderById(int order_id);
    Boolean insertOneOrder();


}
