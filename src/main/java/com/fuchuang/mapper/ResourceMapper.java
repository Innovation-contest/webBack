package com.fuchuang.mapper;

import com.fuchuang.pojo.Resource;
import com.fuchuang.pojo.ResourceType;
import com.fuchuang.util.ResourceUtil;

import java.util.List;

public interface ResourceMapper {
    /**
     * 查询所有的资源信息，包含已经分配的工序信息
     * @return resource列表
     */
    List<Resource> selectAllResource();


    /**
     * 批量更新resource的结束时间
     * @param resources resource列表
     * @return 更新是否成功
     */
    Boolean updateResource(List<Resource> resources);


    List<ResourceUtil> selectWebResource();

    Boolean insertResource(Resource resource);

    Boolean deleteResource(int resource_id);

    ResourceType selectResourceType(String workspace, String resource_type);

    Boolean updateToZero();

    /**
     * 查询所有资源信息用作排产
     * @return 资源信息list
     */
    List<Resource> selectResource();
}
