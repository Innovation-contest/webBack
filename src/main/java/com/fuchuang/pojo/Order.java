package com.fuchuang.pojo;

import java.util.HashMap;
//import java.util.List;
import java.util.Map;

public class Order {
    private int priority;
    private int end_time;
    private Map<Integer,Integer> products;
    private Map<Integer,Integer> processes;

    // Order(int priority,int end_time,int[]products,int[]processes){
    //     this.priority = priority;
    //     this.end_time = end_time;
    //     this.products = new HashMap<>();
    //     for(int p : products){
    //         if (this.products.get(p) == null){
    //             this.products.put(p,this.products.getOrDefault(p, -1)+1);
    //         }
    //     }
    // }
}