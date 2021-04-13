package com.fuchuang.mapper;

import com.fuchuang.pojo.*;
import com.fuchuang.pojo.Process;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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
}
