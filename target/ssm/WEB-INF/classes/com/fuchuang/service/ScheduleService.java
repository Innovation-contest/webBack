package com.fuchuang.service;

import com.fuchuang.pojo.Order;
import com.fuchuang.pojo.Resource;

import java.util.ArrayList;
import java.util.List;

public interface ScheduleService {
    public List<Resource> schedule(List<Order> orders);
}