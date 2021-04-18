/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2021/4/13 9:58:33                            */
/*==============================================================*/


drop table if exists distri_process;

drop table if exists need_resouce;

drop table if exists orderinfo;

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
    references orderinfo (order_id) on delete restrict on update restrict;


insert into orderinfo values (1, 1000, '12th服创大赛', 0,5,15);
insert into orderinfo values (2, 1050, '12th服创大赛', 0,0,3);
insert into orderinfo values (3, 950, '12th服创大赛', 0,10,25);


insert into product_fixed values (1);
insert into product_fixed values (2);
insert into product_fixed values (3);
insert into product_fixed values (4);
insert into product_fixed values (5);
insert into product_fixed values (6);

# insert into semi_product values (2),(3),(4),(5),(6);
#
# insert into product_semi values (1,2),
#                                 (1,3),
#                                 (1,4),
#                                 (2,1),
#                                 (2,5),
#                                 (3,2),
#                                 (3,6),
#                                 (4,2),
#                                 (4,4),
#                                 (5,3),
#                                 (5,6),
#                                 (6,1),
#                                 (6,2);
#
# insert into product_fixed values (1);
#
# insert into product_fixed (product_id) values (1);
# insert into  semi_product (semi_id) values (2);
# insert into product_semi (product_id, semi_id) values (1,2);
# insert into resource (resource_id, workspace, resource_type, to_free_time) values
#     (1,'produce','机床',30);
# insert into need_resouce (resource_type, resouce_num, process_id) values
#     ('人员',2,1);
# insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values
#     (1,1,true,10,20,'assemble');
#
#
#
#
# insert into processes values (1,1,true,10,5,'Processing'),
#                              (2,1,false,1,10,'Processing'),
#                              (3,1,false,1,2,'Processing'),
#                              (4,1,true,15,20,'assembly'),
#                              (5,2,false,1,12,'Processing'),
#                              (6,2,false,1,10,'Processing'),
#                              (7,2,false,1,20,'Processing'),
#                              (8,2,true,15,20,'assembly'),
#                              (9,3,false,1,5,'Processing'),
#                              (10,3,false,1,10,'Processing'),
#                              (11,3,false,1,2,'Processing'),
#                              (12,3,true,15,20,'assembly'),
#                              (13,4,false,1,5,'Processing'),
#                              (14,4,true,12,10,'assembly'),
#                              (15,5,false,1,2,'Processing'),
#                              (16,5,true,15,20,'assembly'),
#                              (17,6,false,1,2,'Processing'),
#                              (18,6,true,15,20,'assembly');
#
# insert into need_resouce values ('机床',1,1,1),
#                                 ('人员',2,2,1),
#                                 ('高级设备',2,3,1),
#                                 ('机床',1,4,2),
#                                 ('人员',2,5,2),
#                                 ('高级设备',2,6,2),
#                                 ('机床',1,7,3),
#                                 ('人员',2,8,3),
#                                 ('高级设备',2,9,3),
#                                 ('机床',1,10,4),
#                                 ('人员',2,11,4),
#                                 ('高级设备',2,54,4),
#                                 ('机床',1,12,5),
#                                 ('人员',2,13,5),
#                                 ('高级设备',2,14,5),
#                                 ('机床',1,15,6),
#                                 ('人员',2,16,6),
#                                 ('高级设备',2,17,6),
#                                 ('机床',1,18,7),
#                                 ('人员',2,19,7),
#                                 ('高级设备',2,20,7),
#                                 ('机床',1,21,8),
#                                 ('人员',2,22,8),
#                                 ('高级设备',2,23,8),
#                                 ('机床',1,24,9),
#                                 ('人员',2,25,9),
#                                 ('高级设备',2,26,9),
#                                 ('机床',1,27,10),
#                                 ('人员',2,28,10),
#                                 ('高级设备',2,29,10),
#                                 ('机床',1,30,11),
#                                 ('人员',2,31,11),
#                                 ('高级设备',2,32,11),
#                                 ('机床',1,33,12),
#                                 ('人员',2,34,12),
#                                 ('高级设备',2,35,12),
#                                 ('机床',1,36,13),
#                                 ('人员',2,37,13),
#                                 ('高级设备',2,38,13),
#                                 ('机床',1,39,14),
#                                 ('人员',2,40,14),
#                                 ('高级设备',2,41,14),
#                                 ('机床',1,42,15),
#                                 ('人员',2,43,15),
#                                 ('高级设备',2,44,15),
#                                 ('机床',1,45,16),
#                                 ('人员',2,46,16),
#                                 ('高级设备',2,47,16),
#                                 ('机床',1,48,17),
#                                 ('人员',2,49,17),
#                                 ('高级设备',2,50,17),
#                                 ('机床',1,51,18),
#                                 ('人员',2,52,18),
#                                 ('高级设备',2,53,18);
#
# insert into real_product values (5,1,18,1);
# insert into real_product values (6,1,6,2);
# insert into real_product values (4,2,10,3);
# insert into real_product values (2,2,15,4);
# insert into real_product values (5,2,18,5);
# insert into real_product values (3,3,15,6);
# insert into real_product values (1,3,10,7);

INSERT INTO SEMI_PRODUCT VALUES(1);
INSERT INTO SEMI_PRODUCT VALUES(18);
INSERT INTO SEMI_PRODUCT VALUES(15);
INSERT INTO SEMI_PRODUCT VALUES(14);
INSERT INTO SEMI_PRODUCT VALUES(6);
INSERT INTO SEMI_PRODUCT VALUES(16);
INSERT INTO SEMI_PRODUCT VALUES(9);
INSERT INTO SEMI_PRODUCT VALUES(4);
INSERT INTO SEMI_PRODUCT VALUES(19);
INSERT INTO SEMI_PRODUCT VALUES(3);
INSERT INTO SEMI_PRODUCT VALUES(20);
INSERT INTO SEMI_PRODUCT VALUES(5);
INSERT INTO SEMI_PRODUCT VALUES(12);
INSERT INTO SEMI_PRODUCT VALUES(17);
INSERT INTO SEMI_PRODUCT VALUES(7);
INSERT INTO SEMI_PRODUCT VALUES(10);


INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(1,4);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(1,15);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(1,1);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(1,10);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(1,18);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(1,6);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(2,19);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(2,5);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(2,15);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(2,14);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(2,6);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(2,1);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(3,16);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(3,7);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(3,19);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(3,10);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(3,4);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(4,6);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(4,19);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(4,14);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(4,3);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(4,20);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(4,5);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(5,6);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(5,12);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(5,17);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(5,7);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(5,4);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(5,10);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(6,1);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(6,4);



insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(6,1,false,1,1,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(7,1,false,1,6,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(8,1,false,1,2,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(9,1,true,15,40,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(11,2,false,1,4,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(12,2,true,8,20,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(13,2,false,1,6,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(14,2,false,1,6,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(16,3,true,15,80,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(17,3,true,8,80,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(18,3,true,10,80,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(19,3,true,6,40,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(21,4,true,10,120,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(22,4,true,6,20,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(23,4,true,10,40,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(24,4,false,1,1,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(26,5,false,1,2,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(27,5,false,1,6,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(28,5,true,6,40,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(29,5,true,8,20,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(31,6,false,1,2,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(32,6,true,8,120,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(33,6,false,1,2,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(34,6,true,15,120,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(36,7,false,1,2,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(37,7,false,1,1,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(38,7,false,1,1,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(39,7,false,1,1,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(41,8,false,1,2,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(42,8,false,1,2,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(43,8,false,1,1,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(44,8,true,6,20,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(46,9,true,10,120,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(47,9,true,10,20,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(48,9,false,1,2,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(49,9,true,6,40,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(51,10,false,1,1,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(52,10,false,1,2,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(53,10,false,1,2,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(54,10,true,8,40,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(56,11,false,1,1,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(57,11,true,6,120,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(58,11,true,10,80,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(59,11,false,1,4,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(61,12,false,1,2,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(62,12,false,1,2,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(63,12,true,8,120,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(64,12,false,1,2,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(66,13,false,1,1,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(67,13,true,10,120,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(68,13,false,1,2,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(69,13,false,1,4,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(71,14,true,8,20,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(72,14,true,6,120,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(73,14,false,1,2,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(74,14,false,1,1,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(76,15,false,1,1,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(77,15,false,1,4,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(78,15,true,15,40,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(79,15,true,8,120,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(81,16,true,10,20,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(82,16,true,6,120,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(83,16,true,15,80,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(84,16,true,10,20,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(86,17,true,8,20,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(87,17,false,1,6,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(88,17,false,1,4,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(89,17,false,1,4,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(91,18,false,1,2,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(92,18,false,1,4,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(93,18,true,6,120,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(94,18,false,1,6,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(96,19,false,1,6,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(97,19,true,6,40,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(98,19,false,1,2,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(99,19,true,15,40,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(101,20,true,10,40,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(102,20,false,1,2,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(103,20,false,1,6,'加工');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(104,20,false,1,6,'加工');


insert into need_resouce (resource_type, resouce_num, process_id) values('机床',3,6);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,6);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',2,6);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',3,6);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',4,7);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,7);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',2,7);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',2,7);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',3,7);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,7);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',3,8);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,8);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,8);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,8);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,8);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',3,9);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,9);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',2,9);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,9);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',2,11);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,11);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',4,11);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,11);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,11);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,12);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,12);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,12);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',2,13);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,13);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,13);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,13);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',2,14);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',3,14);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,14);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,14);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',1,16);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,16);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',4,16);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,16);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,16);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,17);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',5,17);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',2,17);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',2,18);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,18);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',4,18);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,18);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,18);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',4,19);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,19);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,19);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,19);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,19);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',1,21);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,21);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',5,21);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,21);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',1,22);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,22);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,22);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,22);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,23);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,23);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',2,23);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,23);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,23);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',1,24);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',3,24);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',2,24);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,24);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,24);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',3,26);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',2,26);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',2,26);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,26);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,26);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',4,27);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',5,27);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,28);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,28);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,28);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,28);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,29);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',4,29);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,29);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',3,29);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,29);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',2,31);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',3,31);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,31);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,31);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',2,32);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',4,32);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',2,32);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,32);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,32);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',2,33);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',4,33);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',2,33);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,33);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,33);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',4,34);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',3,34);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',3,36);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,36);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',5,36);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,36);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',2,37);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',3,37);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,37);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',3,38);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',3,38);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',2,38);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',3,39);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',3,39);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,39);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,39);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,39);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,41);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',4,41);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,41);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,41);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,41);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',4,42);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,42);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',5,42);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,42);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,42);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,42);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,43);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,43);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,43);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,43);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',1,44);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,44);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,44);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,44);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,46);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,46);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,47);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,47);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,47);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,47);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',4,48);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,48);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',2,48);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,48);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',2,49);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,49);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',3,49);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',3,51);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,51);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',2,51);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,51);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',3,51);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,51);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',4,52);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',3,52);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,52);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',3,52);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',3,53);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,53);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',5,53);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,53);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,53);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,53);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',2,54);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,54);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,54);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,54);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,54);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,54);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',3,56);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,56);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',2,56);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,56);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,56);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,56);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',1,57);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,57);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,57);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,57);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',2,58);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,58);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,58);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',2,58);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,58);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,58);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,59);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,59);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,59);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,59);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,61);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,61);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,61);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',3,61);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,62);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,62);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,62);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,62);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',4,63);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,63);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',5,63);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',2,63);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,63);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,63);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',2,64);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,64);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,64);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,64);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',4,66);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,66);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',4,66);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,66);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',3,66);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,66);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',3,67);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,67);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',4,67);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,67);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,67);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',4,68);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,68);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,68);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',2,68);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,68);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,68);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',3,69);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,69);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',2,69);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,69);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,69);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',3,71);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,71);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',4,71);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,71);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,71);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,71);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',2,72);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',2,72);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,72);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,72);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,73);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,73);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,73);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,73);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',1,74);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,74);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',3,74);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,74);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',1,76);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,76);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',3,76);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,76);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,76);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,77);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',3,77);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',2,77);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,77);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,78);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,78);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,78);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',4,79);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,79);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,79);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,79);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,79);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',1,81);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,81);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',3,81);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,81);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,81);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',2,82);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,82);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,82);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,82);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,83);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',5,83);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',2,83);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,83);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,83);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',3,84);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,84);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',4,84);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',2,84);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,84);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,84);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',5,86);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,86);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',3,86);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,86);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',1,87);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',4,87);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',2,87);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,87);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',3,88);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,88);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',2,88);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',3,88);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,88);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',1,89);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',4,89);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,89);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',3,91);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,91);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',2,91);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,91);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,91);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,91);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,92);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,92);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,92);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,92);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',2,93);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,93);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,93);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',2,93);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',3,93);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,93);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',1,94);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,94);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',5,94);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,94);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',3,94);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,94);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',2,96);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,96);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',4,96);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,96);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,96);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,97);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',2,97);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,97);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,97);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,97);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',1,98);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,98);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',2,98);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,98);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,98);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',1,99);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',5,99);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,99);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',1,101);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',5,101);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,101);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',1,101);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,101);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',3,102);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',1,102);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',1,102);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,102);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',2,103);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',1,103);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',3,103);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,103);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',1,103);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级机床',2,104);
insert into need_resouce (resource_type, resouce_num, process_id) values('人员',3,104);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级人员',3,104);
insert into need_resouce (resource_type, resouce_num, process_id) values('设备',2,104);
insert into need_resouce (resource_type, resouce_num, process_id) values('高级设备',2,104);
insert into need_resouce (resource_type, resouce_num, process_id) values('机床',3,201);


insert into resource (resource_id, workspace, resource_type, to_free_time) values(1,'加工','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(2,'加工','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(3,'加工','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(4,'加工','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(5,'加工','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(6,'加工','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(7,'加工','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(8,'加工','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(9,'加工','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(10,'加工','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(11,'加工','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(12,'加工','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(13,'加工','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(14,'加工','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(15,'加工','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(16,'加工','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(17,'加工','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(18,'加工','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(19,'加工','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(20,'加工','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(21,'加工','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(22,'加工','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(23,'加工','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(24,'加工','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(25,'加工','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(26,'加工','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(27,'加工','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(28,'加工','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(29,'加工','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(30,'加工','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(31,'加工','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(32,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(33,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(34,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(35,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(36,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(37,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(38,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(39,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(40,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(41,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(42,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(43,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(44,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(45,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(46,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(47,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(48,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(49,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(50,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(51,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(52,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(53,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(54,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(55,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(56,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(57,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(58,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(59,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(60,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(61,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(62,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(63,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(64,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(65,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(66,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(67,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(68,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(69,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(70,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(71,'加工','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(72,'加工','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(73,'加工','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(74,'加工','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(75,'加工','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(76,'加工','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(77,'加工','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(78,'加工','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(79,'加工','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(80,'加工','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(81,'加工','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(82,'加工','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(83,'加工','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(84,'加工','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(85,'加工','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(86,'加工','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(87,'加工','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(88,'加工','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(89,'加工','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(90,'加工','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(91,'加工','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(92,'加工','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(93,'加工','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(94,'加工','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(95,'加工','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(96,'加工','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(97,'加工','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(98,'加工','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(99,'加工','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(100,'加工','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(101,'加工','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(102,'加工','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(103,'加工','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(104,'加工','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(105,'加工','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(106,'加工','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(107,'加工','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(108,'加工','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(109,'加工','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(110,'加工','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(111,'加工','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(112,'加工','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(113,'加工','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(114,'加工','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(115,'加工','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(116,'加工','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(117,'加工','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(118,'加工','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(119,'装配','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(120,'装配','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(121,'装配','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(122,'装配','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(123,'装配','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(124,'装配','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(125,'装配','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(126,'装配','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(127,'装配','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(128,'装配','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(129,'装配','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(130,'装配','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(131,'装配','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(132,'装配','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(133,'装配','机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(134,'装配','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(135,'装配','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(136,'装配','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(137,'装配','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(138,'装配','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(139,'装配','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(140,'装配','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(141,'装配','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(142,'装配','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(143,'装配','高级机床',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(144,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(145,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(146,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(147,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(148,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(149,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(150,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(151,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(152,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(153,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(154,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(155,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(156,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(157,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(158,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(159,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(160,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(161,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(162,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(163,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(164,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(165,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(166,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(167,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(168,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(169,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(170,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(171,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(172,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(173,'装配','人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(174,'装配','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(175,'装配','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(176,'装配','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(177,'装配','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(178,'装配','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(179,'装配','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(180,'装配','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(181,'装配','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(182,'装配','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(183,'装配','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(184,'装配','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(185,'装配','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(186,'装配','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(187,'装配','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(188,'装配','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(189,'装配','高级人员',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(190,'装配','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(191,'装配','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(192,'装配','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(193,'装配','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(194,'装配','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(195,'装配','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(196,'装配','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(197,'装配','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(198,'装配','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(199,'装配','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(200,'装配','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(201,'装配','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(202,'装配','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(203,'装配','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(204,'装配','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(205,'装配','设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(206,'装配','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(207,'装配','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(208,'装配','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(209,'装配','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(210,'装配','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(211,'装配','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(212,'装配','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(213,'装配','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(214,'装配','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(215,'装配','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(216,'装配','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(217,'装配','高级设备',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(218,'装配','高级设备',0);

