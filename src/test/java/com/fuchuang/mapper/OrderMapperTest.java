package com.fuchuang.mapper;

import com.fuchuang.pojo.*;
import com.fuchuang.pojo.Process;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml","classpath:springmvc-config.xml"})
public class OrderMapperTest {
    @Autowired
    private  OrderMapper orderMapper;

    @Autowired
    private  RealProductMapper realProductMapper;

    @Autowired
    private  ProductMapper productMapper;

    @Autowired
    private ProcessMapper processMapper;

    @Autowired
    private SemiProductMapper semiProductMapper;

    @Autowired
    private ResourceMapper resourceMapper;

    @Autowired
    private DistriProcessMapper distriProcessMapper;

    @Test
    public void allOrder(){
        List<Order> orders=orderMapper.selectAllOrder();
        Order order1 = orderMapper.selectOrderById(1);
//        for(Order order:orders){
            System.out.println(order1.toString());
//        }
    }

    @Test
    public void selectone(){
        List<RealProduct> realProducts = realProductMapper.findProductById(3);
        for(RealProduct realProduct:realProducts){
            System.out.println(realProduct.toString());
        }
    }

    @Test
    public void test_productsplit(){
        Product product = productMapper.selectProductById(3);
        System.out.println(product.toString());
    }

    @Test
    public void test_semiprocess(){
        List<SemiProduct> semiProducts=semiProductMapper.selectSemiByProductId(3);
        for(SemiProduct semiProduct:semiProducts){
            System.out.println(semiProduct);
        }
    }

    @Test
    public void test_process(){
        List<Process> processes =processMapper.selectProcessBySemiId(2);
        for(Process process:processes){
            System.out.println(process.toString());
        }
    }

    @Test
//    @Transactional(propagation = Propagation.REQUIRED)
    public void add_order(){
        Order order=new Order();
        order.setOrder_descri("12th服创大赛");

        order.setOrder_start_time(0);
        order.setOrder_end_time(100);
        List<RealProduct> realProducts= new ArrayList<>();
        RealProduct realProduct1 =new RealProduct();
        realProduct1.setProduct_id(1);
        realProduct1.setOrder_id(8);
        realProduct1.setProduct_amount(5);
        realProducts.add(realProduct1);

        orderMapper.insertOneOrder(order);
        realProductMapper.insertProducts(realProducts);

    }

    @Test
    public void add_disProcess(){
        List<Process> processes = new ArrayList<>();
        Process process1= new Process();
        Process process2= new Process();
        process1.setEnd_time(20);
        process1.setExec_time(10);
        process1.setId(1);
        process1.setMax_num(10);
        process1.setParallel(true);
        process1.setSemi_id(1);
        process1.setWorkspace("assembly");
        process1.setResource_id(1);
        process1.setStart_time(0);
        process2.setEnd_time(20);
        process2.setExec_time(10);
        process2.setId(3);
        process2.setMax_num(1);
        process2.setParallel(false);
        process2.setSemi_id(1);
        process2.setWorkspace("Processing");
        process2.setResource_id(2);
        process2.setStart_time(0);
        processes.add(process1);
        processes.add(process2);
        distriProcessMapper.insertDProcesses(processes);
    }


    @Test
    public void resource(){
        List<Resource> resources= resourceMapper.selectAllResource();
        for(Resource resource:resources){
            System.out.println(resource.toString());
        }
    }


    @Test
    public void t(){
        distriProcessMapper.deleteBYResourceId(1);
        resourceMapper.deleteResource(1);
    }


    @Test
    public void t1(){
        List<Resource> resources = new ArrayList<>();
        Resource resource1 =new Resource();
        Resource resource2= new Resource();
        resource1.setResource_id(2);
        resource1.setEnd_time(10);
        resource2.setResource_id(3);
        resource2.setEnd_time(15);
        resources.add(resource1);
        resources.add(resource2);
        resourceMapper.updateResource(resources);
    }
}
