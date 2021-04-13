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

insert into processes values (1,1,true,10,5,'Processing'),
                             (2,1,false,1,10,'Processing'),
                             (3,1,false,1,2,'Processing'),
                             (4,1,true,15,20,'assembly'),
                             (5,2,false,1,12,'Processing'),
                             (6,2,false,1,10,'Processing'),
                             (7,2,false,1,20,'Processing'),
                             (8,2,true,15,20,'assembly'),
                             (9,3,false,1,5,'Processing'),
                             (10,3,false,1,10,'Processing'),
                             (11,3,false,1,2,'Processing'),
                             (12,3,true,15,20,'assembly'),
                             (13,4,false,1,5,'Processing'),
                             (14,4,true,12,10,'assembly'),
                             (15,5,false,1,2,'Processing'),
                             (16,5,true,15,20,'assembly'),
                             (17,6,false,1,2,'Processing'),
                             (18,6,true,15,20,'assembly');

insert into need_resouce values ('机床',1,1,1),
                                ('人员',2,2,1),
                                ('高级设备',2,3,1),
                                ('机床',1,4,2),
                                ('人员',2,5,2),
                                ('高级设备',2,6,2),
                                ('机床',1,7,3),
                                ('人员',2,8,3),
                                ('高级设备',2,9,3),
                                ('机床',1,10,4),
                                ('人员',2,11,4),
                                ('高级设备',2,54,4),
                                ('机床',1,12,5),
                                ('人员',2,13,5),
                                ('高级设备',2,14,5),
                                ('机床',1,15,6),
                                ('人员',2,16,6),
                                ('高级设备',2,17,6),
                                ('机床',1,18,7),
                                ('人员',2,19,7),
                                ('高级设备',2,20,7),
                                ('机床',1,21,8),
                                ('人员',2,22,8),
                                ('高级设备',2,23,8),
                                ('机床',1,24,9),
                                ('人员',2,25,9),
                                ('高级设备',2,26,9),
                                ('机床',1,27,10),
                                ('人员',2,28,10),
                                ('高级设备',2,29,10),
                                ('机床',1,30,11),
                                ('人员',2,31,11),
                                ('高级设备',2,32,11),
                                ('机床',1,33,12),
                                ('人员',2,34,12),
                                ('高级设备',2,35,12),
                                ('机床',1,36,13),
                                ('人员',2,37,13),
                                ('高级设备',2,38,13),
                                ('机床',1,39,14),
                                ('人员',2,40,14),
                                ('高级设备',2,41,14),
                                ('机床',1,42,15),
                                ('人员',2,43,15),
                                ('高级设备',2,44,15),
                                ('机床',1,45,16),
                                ('人员',2,46,16),
                                ('高级设备',2,47,16),
                                ('机床',1,48,17),
                                ('人员',2,49,17),
                                ('高级设备',2,50,17),
                                ('机床',1,51,18),
                                ('人员',2,52,18),
                                ('高级设备',2,53,18);

insert into real_product values (5,1,18,1);
insert into real_product values (6,1,6,2);
insert into real_product values (4,2,10,3);
insert into real_product values (2,2,15,4);
insert into real_product values (5,2,18,5);
insert into real_product values (3,3,15,6);
insert into real_product values (1,3,10,7);
