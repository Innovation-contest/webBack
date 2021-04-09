package com.fuchuang.service.impl;

import com.fuchuang.pojo.Order;
import com.fuchuang.service.ScheduleService;
import com.fuchuang.service.SplitOrder;

import java.util.List;


public class ScheduleServiceImpl implements ScheduleService {

    /**
     *
     * @param orders 拆分好的订单列表
     * @return 排产完毕的资源列表
     */
    @Override
    public List<Process> schedule(List<Order> orders) {
        return null;
    }



}
