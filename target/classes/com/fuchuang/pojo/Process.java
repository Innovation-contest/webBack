package com.fuchuang.pojo;

import lombok.Data;

import java.util.List;

@Data
public class Process {
    private int id;
    private Boolean parallel;
    private String workspace;
    private int max_num;
    private int semi_id;
    private List<NeedResource> needResources;
    private int exec_time;
}
