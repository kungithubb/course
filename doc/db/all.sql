drop table if exists chapter;
create table chapter (
    id char(8) not null comment 'ID',
    course_id char(8) comment '课程ID',
    `name` varchar(50) comment '名称',
    primary key (id)
) engine=innodb default charset=utf8mb4 comment='大章';

insert into chapter (id,course_id,name) value('0','0','测试大章1');
insert into chapter (id,course_id,name) value('1','0','测试大章2');

/*测试*/

drop table if exists test;
create table test (
    id char(8) not null default '' comment 'id',
    name varchar(50) comment '名称',
    primary key (id)
) engine=innodb default charset=utf8mb4 comment='测试';

insert into test (id,name) values(1,'测试');
insert into test (id,name) values(2,'测试2');