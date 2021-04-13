package com.fuchuang.pojo;

import lombok.Data;

@Data
public class NeedResource {
    private int resource_num;
    private String resource_type;
    private int process_id;
    private String workspace;
}
