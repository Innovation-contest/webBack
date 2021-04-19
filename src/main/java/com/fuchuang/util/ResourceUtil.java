package com.fuchuang.util;

import lombok.Data;

import java.util.List;

@Data
public class ResourceUtil {
    private int resource_id;
    private String resource_type;
    private String workspace;
    List<ProcessUtil> processes;
}
