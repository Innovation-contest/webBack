/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2021/4/11 13:38:26                           */
/*==============================================================*/


drop table if exists distri_process;

drop table if exists need_resouce;

drop table if exists user_order;

drop table if exists processes;

drop table if exists product;

drop table if exists product_fixed;

drop table if exists resource;

drop table if exists semi_product;

drop table if exists user;

/*==============================================================*/
/* Table: distri_process                                        */
/* 已经分配给资源的工序                                             */
/*==============================================================*/
create table distri_process
(
    process_id           int not null,
    resource_id          int not null,
    semi_id              int not null,
    is_para              bool not null,
    max_para             int not null,
    oper_time            int not null,
    pro_workspace        varchar(20) not null,
    pro_start_time       int not null,
    pro_end_time         int not null,
    primary key (process_id)
);

/*==============================================================*/
/* Table: need_resouce                                          */
/* 工序需要的资源                                                 */
/*==============================================================*/
create table need_resouce
(
    need_id              int not null,
    process_id           int not null,
    resource_type        varchar(20) not null,
    resouce_num          int not null,
    primary key (need_id)
);

/*==============================================================*/
/* Table: "user_order"                                          */
/* 用户的订单列表                                                  */
/*==============================================================*/
create table user_order
(
    user_id              int not null,
    order_id             int not null,
    order_end_time       int not null,
    order_descri         text,
    order_start_time     int not null,
    primary key (user_id, order_id)
);

/*==============================================================*/
/* Table: processes                                             */
/* 固定的工序列表                                                  */
/*==============================================================*/
create table processes
(
    process_id           int not null,
    semi_id              int not null,
    is_para              bool not null,
    max_para             int not null,
    oper_time            int not null,
    pro_workspace        varchar(20) not null,
    primary key (process_id)
);

/*==============================================================*/
/* Table: product                                               */
/* 用户订单包含的商品列表                                           */
/*==============================================================*/
create table product
(
    product_id           int not null,
    user_id              int not null,
    order_id             int not null,
    product_num          int not null,
    primary key (product_id)
);

/*==============================================================*/
/* Table: product_fixed                                         */
/* 工厂固定的商品列表                                              */
/*==============================================================*/
create table product_fixed
(
    product_id           int not null,
    primary key (product_id)
);

/*==============================================================*/
/* Table: resource                                              */
/* 工厂的资源列表                                                  */
/*==============================================================*/
create table resource
(
    resource_id          int not null,
    workspace            varchar(20) not null,
    resource_type        varchar(20) not null,
    to_free_time         int not null,
    primary key (resource_id)
);

/*==============================================================*/
/* Table: semi_product                                          */
/* 工厂固定商品的半成品列表                                         */
/*==============================================================*/
create table semi_product
(
    semi_id              int not null,
    product_id           int not null,
    primary key (semi_id)
);

/*==============================================================*/
/* Table: user                                                  */
/* 用户列表                                                      */
/*==============================================================*/
create table user
(
    user_id              int not null,
    primary key (user_id)
);

alter table distri_process add constraint FK_Relationship_7 foreign key (resource_id)
    references resource (resource_id) on delete restrict on update restrict;

alter table distri_process add constraint FK_distri_pro foreign key (process_id)
    references processes (process_id) on delete restrict on update restrict;

alter table need_resouce add constraint FK_pro_resouce foreign key (process_id)
    references processes (process_id) on delete restrict on update restrict;

alter table user_order add constraint FK_Relationship_5 foreign key (user_id)
    references user (user_id) on delete restrict on update restrict;

alter table processes add constraint FK_pro_semi foreign key (semi_id)
    references semi_product (semi_id) on delete restrict on update restrict;

alter table product add constraint FK_be_order foreign key (product_id)
    references product_fixed (product_id) on delete restrict on update restrict;

alter table product add constraint FK_order_product foreign key (user_id, order_id)
    references user_order (user_id, order_id) on delete restrict on update restrict;

alter table semi_product add constraint FK_product_semi foreign key (product_id)
    references product_fixed (product_id) on delete restrict on update restrict;

