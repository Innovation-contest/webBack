package com.fuchuang.pojo;

import java.util.List;

public class Process {
    private int id;
    private Boolean parallel;
    private String workspace;
    private int max_num;
    private List<Object> resource;
    private int start_time;
    private int exec_time;
    private int end_time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Boolean getParallel() {
        return parallel;
    }

    public void setParallel(Boolean parallel) {
        this.parallel = parallel;
    }

    public String getWorkspace() {
        return workspace;
    }

    public void setWorkspace(String workspace) {
        this.workspace = workspace;
    }

    public int getMax_num() {
        return max_num;
    }

    public void setMax_num(int max_num) {
        this.max_num = max_num;
    }

    public List<Object> getResource() {
        return resource;
    }

    public void setResource(List<Object> resource) {
        this.resource = resource;
    }

    public int getStart_time() {
        return start_time;
    }

    public void setStart_time(int start_time) {
        this.start_time = start_time;
    }

    public int getExec_time() {
        return exec_time;
    }

    public void setExec_time(int exec_time) {
        this.exec_time = exec_time;
    }

    public int getEnd_time() {
        return end_time;
    }

    public void setEnd_time(int end_time) {
        this.end_time = end_time;
    }
}
