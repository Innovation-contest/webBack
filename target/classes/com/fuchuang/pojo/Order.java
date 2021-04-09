package com.fuchuang.pojo;

import java.util.HashMap;
//import java.util.List;
import java.util.Map;

public class Order {
    private int priority;
    private int end_time;
    private Map<Integer,Integer> products;
    private Map<Integer,Integer> product_semis;

    public int getEnd_time() {
        return end_time;
    }

    public void setEnd_time(int end_time) {
        this.end_time = end_time;
    }

    public Map<Integer, Integer> getProducts() {
        return products;
    }

    public void setProducts(Map<Integer, Integer> products) {
        this.products = products;
    }

    public Map<Integer, Integer> getProduct_semis() {
        return product_semis;
    }

    public void setProduct_semis(Map<Integer, Integer> processes) {
        this.product_semis = processes;
    }

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

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