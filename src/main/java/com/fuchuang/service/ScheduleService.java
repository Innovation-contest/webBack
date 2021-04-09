package com.fuchuang.service;

import com.fuchuang.pojo.Order;

import java.util.List;

public interface ScheduleService {
    public List<Process> schedule(List<Order> orders);
}
