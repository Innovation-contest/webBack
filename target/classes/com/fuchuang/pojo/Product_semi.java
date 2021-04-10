package com.fuchuang.pojo;

import  java.util.List;

public class Product_semi {
    private int id;
    private int seq;
    private List<Process> processes;

    //判断指针是否到底
    public boolean isBottom(){
        return seq == processes.size()-1;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public Process getProcess(int seq){
        return processes.get(seq);
    }

    public List<Process> getProcesses() {
        return processes;
    }

    public void setProcesses(List<Process> processes) {
        this.processes = processes;
    }


}
