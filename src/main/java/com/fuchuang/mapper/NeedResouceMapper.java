package com.fuchuang.mapper;

import com.fuchuang.pojo.NeedResource;

import java.util.List;

public interface NeedResouceMapper {
    List<NeedResource> selectResourceByProcessId(int process_id);
}
