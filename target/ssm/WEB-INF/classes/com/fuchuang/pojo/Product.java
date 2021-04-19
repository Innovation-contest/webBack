package com.fuchuang.pojo;

import lombok.Data;

import java.util.List;

@Data
public class Product {
    private int product_id;
    private List<SemiProduct> semiProducts;
}
