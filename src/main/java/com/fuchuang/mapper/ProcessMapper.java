package com.fuchuang.mapper;

import com.fuchuang.pojo.Process;

import java.util.List;

public interface ProcessMapper {
    List<Process> selectProcessBySemiId(int semi_id);

}
