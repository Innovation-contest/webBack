package com.fuchuang.mapper;

import com.fuchuang.pojo.Resource;

import java.util.List;

public interface ResourceMapper {
    /**
     * 查询所有的资源信息，包含已经分配的工序信息
     * @return resource列表
     */
    List<Resource> selectAllResource();

    /**
     * 批量更新resource的结束时间
     * @param resources
     * @return
     */
    Boolean updateResource(List<Resource> resources);



    Boolean insertResource(Resource resource);

}
