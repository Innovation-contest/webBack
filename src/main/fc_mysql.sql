/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2021/4/13 9:58:33                            */
/*==============================================================*/


drop table if exists distri_process;

drop table if exists need_resouce;

drop table if exists ordeinfo;

drop table if exists processes;

drop table if exists product_fixed;

drop table if exists product_semi;

drop table if exists real_product;

drop table if exists resource;

drop table if exists semi_product;

/*==============================================================*/
/* Table: distri_process                                        */
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
    id                   int not null,
    primary key (id)
);

/*==============================================================*/
/* Table: need_resouce                                          */
/*==============================================================*/
create table need_resouce
(
    resource_type        varchar(20) not null,
    resouce_num          int not null,
    need_id              int not null,
    process_id           int not null,
    primary key (need_id)
);

/*==============================================================*/
/* Table: ordeinfo                                              */
/*==============================================================*/
create table ordeinfo
(
    order_id             int not null,
    order_end_time       int not null,
    order_descri         text,
    order_start_time     int not null,
    real_start_time      int,
    real_end_time        int,
    primary key (order_id)
);

/*==============================================================*/
/* Table: processes                                             */
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
/* Table: product_fixed                                         */
/*==============================================================*/
create table product_fixed
(
    product_id           int not null,
    primary key (product_id)
);

/*==============================================================*/
/* Table: product_semi                                          */
/*==============================================================*/
create table product_semi
(
    product_id           int not null,
    semi_id              int not null,
    primary key (product_id, semi_id)
);

/*==============================================================*/
/* Table: real_product                                          */
/*==============================================================*/
create table real_product
(
    product_id           int not null,
    order_id             int not null,
    product_num          int not null,
    id                   int not null,
    primary key (id)
);

/*==============================================================*/
/* Table: resource                                              */
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
/*==============================================================*/
create table semi_product
(
    semi_id              int not null,
    primary key (semi_id)
);

alter table distri_process add constraint FK_Relationship_7 foreign key (resource_id)
    references resource (resource_id) on delete restrict on update restrict;

alter table distri_process add constraint FK_distri_pro foreign key (process_id)
    references processes (process_id) on delete restrict on update restrict;

alter table need_resouce add constraint FK_pro_resouce foreign key (process_id)
    references processes (process_id) on delete restrict on update restrict;

alter table processes add constraint FK_pro_semi foreign key (semi_id)
    references semi_product (semi_id) on delete restrict on update restrict;

alter table product_semi add constraint FK_product_semi foreign key (product_id)
    references product_fixed (product_id) on delete restrict on update restrict;

alter table product_semi add constraint FK_product_semi2 foreign key (semi_id)
    references semi_product (semi_id) on delete restrict on update restrict;

alter table real_product add constraint FK_be_order foreign key (product_id)
    references product_fixed (product_id) on delete restrict on update restrict;

alter table real_product add constraint FK_order_product foreign key (order_id)
    references ordeinfo (order_id) on delete restrict on update restrict;


insert into ordeinfo values (1, 1000, '12th服创大赛', 0,5,15);
insert into ordeinfo values (2, 1050, '12th服创大赛', 0,0,3);
insert into ordeinfo values (3, 950, '12th服创大赛', 0,10,25);


insert into product_fixed values (1);
insert into product_fixed values (2);
insert into product_fixed values (3);
insert into product_fixed values (4);
insert into product_fixed values (5);
insert into product_fixed values (6);

insert into semi_product values (2),(3),(4),(5),(6);

insert into product_semi values (1,2),
                                (1,3),
                                (1,4),
                                (2,1),
                                (2,5),
                                (3,2),
                                (3,6),
                                (4,2),
                                (4,4),
                                (5,3),
                                (5,6),
                                (6,1),
                                (6,2);



insert into real_product values (5,1,18,1);
insert into real_product values (6,1,6,2);
insert into real_product values (4,2,10,3);
insert into real_product values (2,2,15,4);
insert into real_product values (5,2,18,5);
insert into real_product values (3,3,15,6);
insert into real_product values (1,3,10,7);
