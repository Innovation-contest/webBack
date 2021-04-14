package com.fuchuang.pojo;

import lombok.Data;

import java.util.List;

@Data
public class Process {
    private int id;
    private Boolean parallel;
    private String workspace;
    private int max_num;
    private List<Resource> resource;
    private int start_time;
    private int exec_time;
    private int end_time;
}
