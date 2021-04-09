package com.fuchuang.pojo;

import java.util.List;

public class Resource {
    private int id;
    private String type;
    private String workspace;
    private int end_time;
    private List<Object> processes;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getWorkspace() {
        return workspace;
    }

    public void setWorkspace(String workspace) {
        this.workspace = workspace;
    }

    public int getEnd_time() {
        return end_time;
    }

    public void setEnd_time(int end_time) {
        this.end_time = end_time;
    }

    public List<Object> getProcesses() {
        return processes;
    }

    public void setProcesses(List<Object> processes) {
        this.processes = processes;
    }


}