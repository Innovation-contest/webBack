package com.fuchuang.pojo;

import lombok.Data;

import java.util.List;

@Data
public class Product {
    private int id;
    private List<SemiProduct> semiProducts;
}
