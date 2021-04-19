package com.fuchuang.pojo;

import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class Order {
    private int order_id;
    private int order_end_time;
    private int order_start_time;
    private int real_start_time;
    private int real_end_time;
    private String order_descri;
    private List<RealProduct> products;
}