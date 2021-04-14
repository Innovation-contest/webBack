package com.fuchuang.mapper;

import com.fuchuang.pojo.NeedResource;

import java.util.List;

public interface NeedResouceMapper {
    /**
     *
     * @param process_id 工序编号
     * @return 需要的资源列表
     */
    List<NeedResource> selectResourceByProcessId(int process_id);
}
