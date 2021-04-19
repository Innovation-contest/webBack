package com.fuchuang.service.impl;

import com.fuchuang.mapper.DistriProcessMapper;
import com.fuchuang.mapper.OrderMapper;
import com.fuchuang.mapper.ProductMapper;
import com.fuchuang.mapper.ResourceMapper;
import com.fuchuang.pojo.*;
import com.fuchuang.pojo.Process;
import com.fuchuang.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.swing.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class ScheduleServiceImpl implements ScheduleService {

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private ResourceMapper resourceMapper;

    @Autowired
    private SplitOrderImpl splitOrder;

    @Autowired
    private DistriProcessMapper distriProcessMapper;
    /**
     *
     * @param orders 拆分好的订单列表
     * @return 排产完毕的资源列表
     */
    @Override
    public List<Resource> schedule(List<Order> orders) {
        resourceMapper.updateToZero();
        distriProcessMapper.deleteAll();

        List<Resource> resources = resourceMapper.selectAllResource();
        //调用数据库界面以获取资源列表

        //将半成品集合对应为实例集合
        List<SemiProduct> semis_todo = new ArrayList<>();

        //收集每个订单的半成品列表
        for (Order order : orders) {
            //设置订单开始时间
            order.setReal_start_time(getResourceLastTime(resources,false));

            semis_todo = splitOrder.split(order);
            List<Process>assembly = new ArrayList<>();

            while(semis_todo.size() != 0){
                //收集每个半成品工序到列表中
                List<Process>chief = new ArrayList<>();

                for(int i=semis_todo.size()-1;i>=0;i--){
                    //得到当前半成品首要工序
                    Process proc = semis_todo.get(i).getProcesses().get(semis_todo.get(i).getSeq());
                    if(proc.getWorkspace().equals("装配")){
                        //加入装配工序列表
                        assembly.add(proc);
                    }
                    else{
                        //加入首要工序列表
                        chief.add(proc);
                    }
                    //判断是否为最后一道工序
                    if(!semis_todo.get(i).isBottom()){
                        //调整列表指针seq到下一位
                        semis_todo.get(i).setSeq(semis_todo.get(i).getSeq()+1);
                    }
                    else{
                        semis_todo.remove(i);
                    }
                }

                List<Process>processes = chief;
                //排入首要工序到资源中
                for(int j=0;j<processes.size();j++){
                    Process proc = processes.get(j);
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
                        Process ptmp = new Process();
                        try{
                            ptmp = proc.clone();
                        }catch (CloneNotSupportedException e){
                            e.printStackTrace();
                        }
                        //填入对应resourceid
                        ptmp.setResource_id(resources.get(insert_id).getResource_id());
                        //更新工序中的相对时间
                        last_time = last_time >= resources.get(insert_id).getEnd_time()?last_time:resources.get(insert_id).getEnd_time();
                        ptmp.setStart_time(last_time);
                        ptmp.setEnd_time(last_time + ptmp.getExec_time());
                        //将当前工序加入工厂资源队列
                        List<Process> temp = new ArrayList<>(resources.get(insert_id).getProcesses());
                        temp.add(ptmp);
                        resources.get(insert_id).setProcesses(temp);
                        //设置资源上工序的结束时间
                        resources.get(insert_id).setEnd_time(resources.get(insert_id).getEnd_time() + proc.getExec_time());
                    }
                    //设置并行数
                    int para_num = proc.getMax_num();
                    int now_id = proc.getId();
                    for(int i=0;i<para_num;i++){
                        int flag = 0;
                        for(Process p : processes){
                            if(p.getId() == now_id){
                                processes.remove(p);
                                flag = 1;
                                break;
                            }
                        }
                        if(flag == 0){
                            j--;
                            break;
                        }
                    }
                }
            }

            List<Process>processes = assembly;
            //排入装配工序到资源中
            for(int j=0;j<processes.size();j++){
                Process proc = processes.get(j);
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
                    //找到前置资源中最晚结束的
                    last_time = getResourceLastTime(resources,false);

                    if(insert_id != -1){
                        InsertIdList.add(insert_id);
                    } else {
                        System.out.println("Can't insert!");
                        return null;
                    }
                }
                for(int insert_id: InsertIdList) {
                    Process ptmp = new Process();
                    try{
                        ptmp = proc.clone();
                    }catch (CloneNotSupportedException e){
                        e.printStackTrace();
                    }
                    //填入对应resourceid
                    ptmp.setResource_id(resources.get(insert_id).getResource_id());
                    //更新工序中的相对时间
                    last_time = last_time >= resources.get(insert_id).getEnd_time()?last_time:resources.get(insert_id).getEnd_time();
                    ptmp.setStart_time(last_time);
                    ptmp.setEnd_time(last_time + ptmp.getExec_time());
                    //将当前工序加入工厂资源队列
                    List<Process> temp = new ArrayList<>(resources.get(insert_id).getProcesses());
                    temp.add(ptmp);
                    resources.get(insert_id).setProcesses(temp);
                    //设置资源上工序的结束时间
                    resources.get(insert_id).setEnd_time(last_time + proc.getExec_time());
                }
                //设置并行数
                int para_num = proc.getMax_num();
                int now_id = proc.getId();
                for(int i=0;i<para_num;i++){
                    int flag = 0;
                    for(Process p : processes){
                        if(p.getId() == now_id){
                            processes.remove(p);
                            flag = 1;
                            break;
                        }
                    }
                    if(flag == 0){
                        j--;
                        break;
                    }
                }
            }
            //设置订单结束时间
            order.setReal_end_time(getResourceLastTime(resources,true));
        }

        resourceMapper.updateResource(resources);
        for(Resource resource:resources){
            List<Process> processes=resource.getProcesses();
            if(processes.size()>0) {
                distriProcessMapper.insertDProcesses(resource.getProcesses());
            }
        }
        orderMapper.updataOrders(orders);
        return resources;
    }
    private int getResourceLastTime(List<Resource> resources,boolean isAll){
        int last_time = 0;
        for (int i = 0; i < resources.size(); i++) {
            if(resources.get(i).getEnd_time()>last_time && ((isAll&&resources.get(i).getWorkspace().equals("装配"))||(!isAll&&resources.get(i).getWorkspace().equals("加工")))){
                last_time = resources.get(i).getEnd_time();
            }
        }
        return last_time;
    }
}