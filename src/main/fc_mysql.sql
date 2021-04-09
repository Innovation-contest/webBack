/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2021/4/9 9:27:51                             */
/*==============================================================*/


drop table if exists distri_process;

drop table if exists "order";

drop table if exists processes;

drop table if exists product;

drop table if exists product_fixed;

drop table if exists resource;

drop table if exists semi_product;

drop table if exists user;

/*==============================================================*/
/* Table: distri_process                                        */
/*==============================================================*/
create table distri_process
(
   process_id           int not null,
   resource_id          int not null,
   semi_id              int,
   is_para              bool not null,
   max_para             int not null,
   oper_time            int not null,
   pro_workspace        varchar(20) not null,
   pro_start_time       int not null,
   pro_end_time         int,
   primary key (process_id)
);

/*==============================================================*/
/* Table: "order"                                               */
/*==============================================================*/
create table "order"
(
   user_id              int not null,
   order_id             int not null,
   order_end_time       int not null,
   order_descri         text,
   order_start_time     int,
   primary key (user_id, order_id)
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
/* Table: product                                               */
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
/*==============================================================*/
create table product_fixed
(
   product_id           int not null,
   primary key (product_id)
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
   product_id           int not null,
   primary key (semi_id)
);

/*==============================================================*/
/* Table: user                                                  */
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

alter table "order" add constraint FK_Relationship_5 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table processes add constraint FK_pro_semi foreign key (semi_id)
      references semi_product (semi_id) on delete restrict on update restrict;

alter table product add constraint FK_be_order foreign key (product_id)
      references product_fixed (product_id) on delete restrict on update restrict;

alter table product add constraint FK_order_product foreign key (user_id, order_id)
      references "order" (user_id, order_id) on delete restrict on update restrict;

alter table semi_product add constraint FK_product_semi foreign key (product_id)
      references product_fixed (product_id) on delete restrict on update restrict;

