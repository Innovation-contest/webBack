package com.fuchuang.pojo;

import lombok.Data;

import  java.util.List;


@Data
public class SemiProduct implements Cloneable {
    private int id;
    private int seq;
    private List<Process> processes;

    //判断指针是否到底
    public boolean isBottom(){
        return seq == processes.size()-1;
    }

    public SemiProduct clone() throws CloneNotSupportedException {
        return (SemiProduct)super.clone();
    }
}