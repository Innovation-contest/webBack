package com.fuchuang.pojo;

import lombok.Data;

import java.util.Map;

@Data
public class Order {
    private int id;
    private int end_time;
    private int start_time;
    private int real_start_time;
    private int real_end_time;
    private String order_description;
    private Map<Integer,Integer> products;
    private Map<Integer,Integer> product_semis;
}