package com.fuchuang.mapper;

import com.fuchuang.pojo.Process;

import java.util.List;

public interface ProcessMapper {
    /**
     * 查找工序
     * @param semi_id 半成品id
     * @return 半成品的工序list
     */
    List<Process> selectProcessBySemiId(int semi_id);

}
