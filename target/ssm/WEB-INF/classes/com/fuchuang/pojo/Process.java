package com.fuchuang.pojo;

import lombok.Data;

import java.util.List;

@Data
public class Process implements Cloneable{
    private int id;
    private Boolean parallel;
    private String workspace;
    private int max_num;
    private int semi_id;
    private List<NeedResource> needResources;
    private int exec_time;
    // 在排产时才填的值
    private int resource_id;
    private int start_time;
    private int end_time;

    public Process clone() throws CloneNotSupportedException{
        return (Process)super.clone();
    }
}