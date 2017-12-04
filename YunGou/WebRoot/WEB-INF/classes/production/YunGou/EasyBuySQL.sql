
    create table `easybuy`.`easybuy_order_detail`(
        `id` INT not null auto_increment comment '���',
       `orderid` INT not null comment '�������',
       `productid` INT not null comment '��Ʒ���',
       `quantity` INT not null comment '����',
       `cost` FLOAT(10,3) not null comment '���',
        primary key (`id`)
    );
    create unique index `PRIMARY` on `easybuy`.`easybuy_order_detail`(`id`);
    
    create table `easybuy`.`easybuy_news`(
        `id` INT not null auto_increment comment '���',
       `title` VARCHAR(40) not null comment '����',
       `content` VARCHAR(1000) not null comment '����',
       `createTime` DATETIME default 'CURRENT_TIMESTAMP' not null comment '¼������',
        primary key (`id`)
    );
    create unique index `PRIMARY` on `easybuy`.`easybuy_news`(`id`);
   
    create table `easybuy`.`easybuy_order`(
        `id` INT not null auto_increment comment '�������',
       `userid` INT not null comment '�û�id',
       `loginname` VARCHAR(20) not null comment '�û���',
       `useraddress` VARCHAR(200) not null comment '�û���ַ',
       `createTime` DATETIME not null comment '����ʱ��',
       `cost` FLOAT not null comment '���',
       `status` INT not null comment '����״̬,1.�����,2���ͨ��,3����,4�����ѷ���,5���ջ�',
       `type` INT not null comment '��������',
       `serialNumber` VARCHAR(64) not null comment '������',
        primary key (`id`)
    );
    create unique index `PRIMARY` on `easybuy`.`easybuy_order`(`id`);
    
    create table `easybuy`.`easybuy_product_category`(
        `id` INT not null auto_increment comment '���',
       `name` VARCHAR(20) not null comment '����',
       `parentId` INT not null comment '������',
       `type` INT comment '1,һ������;2,2������,3,��������',
        primary key (`id`)
    );

    create unique index `PRIMARY` on `easybuy`.`easybuy_product_category`(`id`);
    
    create table `easybuy`.`easybuy_product`(
        `id` INT not null auto_increment comment '��Ʒ���',
       `name` VARCHAR(20) not null comment '��Ʒ����',
       `description` VARCHAR(100) comment '��Ʒ����',
       `price` FLOAT not null comment '��Ʒ�۸�',
       `stock` INT not null comment '��Ʒ���',
       `categorygoryLevel1` INT not null comment '��Ʒ����һ������',
       `categorygoryLevel2` INT not null comment '��Ʒ������������',
       `categorygoryLevel3` INT not null comment '��Ʒ������������',
       `fileName` VARCHAR(200) not null comment '��ƷͼƬ�ϴ����ļ���',
       `isDelete` INT comment '�Ƿ�ɾ�� 1:ɾ�� 0:δɾ��',
        primary key (`id`)
    );
    create unique index `PRIMARY` on `easybuy`.`easybuy_product`(`id`);
    
    
    create table `easybuy`.`easybuy_user`(
        `id` INT not null auto_increment,
       `loginName` VARCHAR(255) not null comment '�û���',
       `userName` VARCHAR(255) comment '�û���ʵ����',
       `password` VARCHAR(255) not null comment '����',
       `sex` INT default '0' comment '�Ա�;1Ϊ��,0λŮ',
       `identityCode` VARCHAR(255) comment '���֤��',
       `email` VARCHAR(255) not null comment 'email',
       `mobile` VARCHAR(255) not null comment '�ֻ���',
       `type` INT comment '����,1Ϊ��ͨ�û�,2Ϊ����Ա',
        primary key (`id`)
    );

    create unique index `PRIMARY` on `easybuy`.`easybuy_user`(`id`);