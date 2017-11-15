
    create table `easybuy`.`easybuy_order_detail`(
        `id` INT not null auto_increment comment '编号',
       `orderid` INT not null comment '订单编号',
       `productid` INT not null comment '商品编号',
       `quantity` INT not null comment '数量',
       `cost` FLOAT(10,3) not null comment '金额',
        primary key (`id`)
    );
    create unique index `PRIMARY` on `easybuy`.`easybuy_order_detail`(`id`);
    
    create table `easybuy`.`easybuy_news`(
        `id` INT not null auto_increment comment '编号',
       `title` VARCHAR(40) not null comment '标题',
       `content` VARCHAR(1000) not null comment '内容',
       `createTime` DATETIME default 'CURRENT_TIMESTAMP' not null comment '录入日期',
        primary key (`id`)
    );
    create unique index `PRIMARY` on `easybuy`.`easybuy_news`(`id`);
   
    create table `easybuy`.`easybuy_order`(
        `id` INT not null auto_increment comment '订单编号',
       `userid` INT not null comment '用户id',
       `loginname` VARCHAR(20) not null comment '用户名',
       `useraddress` VARCHAR(200) not null comment '用户地址',
       `createTime` DATETIME not null comment '创建时间',
       `cost` FLOAT not null comment '金额',
       `status` INT not null comment '订单状态,1.带审核,2审核通过,3配送,4卖家已发货,5已收货',
       `type` INT not null comment '订单类型',
       `serialNumber` VARCHAR(64) not null comment '订单号',
        primary key (`id`)
    );
    create unique index `PRIMARY` on `easybuy`.`easybuy_order`(`id`);
    
    create table `easybuy`.`easybuy_product_category`(
        `id` INT not null auto_increment comment '编号',
       `name` VARCHAR(20) not null comment '姓名',
       `parentId` INT not null comment '父分类',
       `type` INT comment '1,一级分类;2,2级分类,3,三级分类',
        primary key (`id`)
    );

    create unique index `PRIMARY` on `easybuy`.`easybuy_product_category`(`id`);
    
    create table `easybuy`.`easybuy_product`(
        `id` INT not null auto_increment comment '商品编号',
       `name` VARCHAR(20) not null comment '商品名称',
       `description` VARCHAR(100) comment '商品描述',
       `price` FLOAT not null comment '商品价格',
       `stock` INT not null comment '商品库存',
       `categorygoryLevel1` INT not null comment '商品所属一级分类',
       `categorygoryLevel2` INT not null comment '商品所属二级分类',
       `categorygoryLevel3` INT not null comment '商品所属三级分类',
       `fileName` VARCHAR(200) not null comment '商品图片上传的文件名',
       `isDelete` INT comment '是否删除 1:删除 0:未删除',
        primary key (`id`)
    );
    create unique index `PRIMARY` on `easybuy`.`easybuy_product`(`id`);
    
    
    create table `easybuy`.`easybuy_user`(
        `id` INT not null auto_increment,
       `loginName` VARCHAR(255) not null comment '用户名',
       `userName` VARCHAR(255) comment '用户真实姓名',
       `password` VARCHAR(255) not null comment '密码',
       `sex` INT default '0' comment '性别;1为男,0位女',
       `identityCode` VARCHAR(255) comment '身份证号',
       `email` VARCHAR(255) not null comment 'email',
       `mobile` VARCHAR(255) not null comment '手机号',
       `type` INT comment '类型,1为普通用户,2为管理员',
        primary key (`id`)
    );

    create unique index `PRIMARY` on `easybuy`.`easybuy_user`(`id`);