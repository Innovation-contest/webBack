package com.fuchuang.service.impl;

import com.fuchuang.mapper.ProductMapper;
import com.fuchuang.mapper.ResourceMapper;
import com.fuchuang.pojo.*;
import com.fuchuang.pojo.Process;
import com.fuchuang.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ScheduleServiceImpl implements ScheduleService {

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private ResourceMapper resourceMapper;

    @Autowired
    private SplitOrderImpl splitOrder;
    /**
     *
     * @param orders 拆分好的订单列表
     * @return 排产完毕的资源列表
     */
    @Override
    public List<Resource> schedule(List<Order> orders) {
        List<Resource> resources = resourceMapper.selectAllResource();
        //调用数据库界面以获取资源列表

        //将半成品集合对应为实例集合
        List<SemiProduct> semis_todo = new ArrayList<>();

        //收集每个订单的半成品列表
        for (Order order : orders) {
            semis_todo.addAll(splitOrder.split(order));
        }

        while(semis_todo.size() != 0){
            //收集每个半成品首要的工序到processes列表中
            Map<Process,Integer>processes = new HashMap<>();

            for(int i=semis_todo.size()-1;i>=0;i--){
                //得到当前半成品首要工序
                Process proc = semis_todo.get(i).getProcesses().get(semis_todo.get(i).getSeq());
                //加入首要工序列表
                processes.put(proc,processes.getOrDefault(proc, 0)+1);
                //判断是否为最后一道工序
                if(!semis_todo.get(i).isBottom()){
                    //调整列表指针seq到下一位
                    semis_todo.get(i).setSeq(semis_todo.get(i).getSeq()+1);
                }
                else{
                    semis_todo.remove(i);
                }
            }

            //排入工序到资源中
            for(Process proc:processes.keySet()){
                //res为当前工序所需资源列表
                List<NeedResource> resNeed = proc.getNeedResources();
                //循环遍历所需资源
                List<Integer> InsertIdList = new ArrayList<>();
                int last_time = 0;

                for (NeedResource needResource : resNeed) {
                    //设置变量寻找最短队列
                    int oldest_time = 9999;
                    int insert_id = -1;
                    //遍历工厂资源列表
                    for (int i = 0; i < resources.size(); i++) {
                        //匹配对应资源且时间最短
                        if (resources.get(i).getType().equals(needResource.getResource_type()) &&
                                resources.get(i).getWorkspace().equals(proc.getWorkspace()) &&
                                resources.get(i).getEnd_time() < oldest_time) {
                            //匹配成功后更新变量
                            oldest_time = resources.get(i).getEnd_time();
                            insert_id = i;
                        }
                    }
                    //找到所需资源中最晚结束的
                    if(last_time < oldest_time){
                        last_time = oldest_time;
                    }

                    if(insert_id != -1){
                        InsertIdList.add(insert_id);
                    } else {
                        System.out.println("Can't insert!");
                        return null;
                    }
                }
                for(int insert_id: InsertIdList) {
                    //更新工序中的resourceId
                    proc.setResource_id(resources.get(insert_id).getId());
                    //更新工序中的相对时间
                    proc.setStart_time(last_time);
                    proc.setEnd_time(last_time + proc.getExec_time());
                    //将当前工序加入工厂资源队列
                    List<Process> temp = resources.get(insert_id).getProcesses();
                    temp.add(proc);
                    resources.get(insert_id).setProcesses(temp);
                    //设置资源上工序的结束时间
                    resources.get(insert_id).setEnd_time(resources.get(insert_id).getEnd_time() + proc.getExec_time());
                }
                //在工序列表中删除排完序的工序
                if(processes.get(proc) > proc.getMax_num()){
                    processes.put(proc,processes.get(proc)-proc.getMax_num());
                    continue;
                }
                else{
                    processes.remove(proc);
                }
            }
        }
        return resources;
    }

}