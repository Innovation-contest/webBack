package com.fuchuang.pojo;

import lombok.Data;
import java.util.List;

@Data
public class Resource {
    private int resource_id;
    private String resource_type;
    private String workspace;
    private int end_time;
    private List<Process> processes;
}