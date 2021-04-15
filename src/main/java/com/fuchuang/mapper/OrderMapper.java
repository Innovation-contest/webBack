package com.fuchuang.mapper;

import com.fuchuang.pojo.Order;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {
    /**
     *
     * @return 获取所有订单
     */
    List<Order> selectAllOrder();

    /**
     *
     * @param order_id 订单id
     * @return 一个订单，包含详情
     */
    Order selectOrderById(int order_id);

    /**
     * 插入一个订单
     * @param order 订单类
     * @return 插入是否成功
     */
    Boolean insertOneOrder(Order order);

    /**
     * 更新一个订单（每个订单排好了就更新一次真实开始时间和结束时间）
     * @param order 订单类
     * @return 更新是否成功
     */
    Boolean updataOrderById(Order order);


    /**
     *
     */
    Boolean deleteOneOrderById(int order_id);
}
