package com.fuchuang.service;

import com.fuchuang.pojo.Resource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface ResourceService {

    public List<Resource> selectAllResource();


    public Boolean insertResource(Resource process);

}
