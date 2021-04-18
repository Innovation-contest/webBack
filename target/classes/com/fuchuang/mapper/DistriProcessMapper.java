package com.fuchuang.mapper;

import com.fuchuang.pojo.Process;

import java.util.List;

public interface DistriProcessMapper {
    /**
     *
     * @param resource_id resource编号
     * @return resource上已经分配的工序列表
     */
    List<Process> selectDProcessByResourceId(int resource_id);

    /**
     *
     * @param processes 分配在一个resource的工序list
     * @return 是否插入成功
     */
    Boolean insertDProcesses(List<Process> processes);


    Boolean deleteBYResourceId(int resource_id);


    Boolean deleteAll();
}
