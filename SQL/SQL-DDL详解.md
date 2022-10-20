# DDL—数据定义语言
(Data Define Language)

DDL主要用于创建、删除、修改数据库中的对象，比如创建、删除、和修改二维表。

核心关键词：<font color="red">create</font>、drop、alter

## 一、创建数据库和表

数据库名：school

关键实体：学院、老师、学生、课程

数据表：学院表(tb_college)、学生表(tb_student)、老师表(tb_teacher)、课程表(tb_course)、选课记录表(tb_record)

```mysql
-- 如果存在名为school的数据库就删除它
drop database if exists `school`;

-- 创建名为school的数据库并设置默认的字符集和排序⽅式
create database `school` default character set utf8mb4 collate utf8mb4_general_ci;

-- 切换到school数据库上下⽂环境
use `school`;

-- 创建学院表
create table `tb_college`
(
`col_id` int unsigned auto_increment comment '编号',
`col_name` varchar(50) not null comment '名称',
`col_intro` varchar(500) default '' comment '介绍',
primary key (`col_id`)
) engine=innodb auto_increment=1 comment '学院表';

-- 创建学⽣表
create table `tb_student`
(
`stu_id` int unsigned not null comment '学号',
`stu_name` varchar(20) not null comment '姓名',
`stu_sex` boolean default 1 not null comment '性别',
`stu_birth` date not null comment '出⽣⽇期',
`stu_addr` varchar(255) default '' comment '籍贯',
`col_id` int unsigned not null comment '所属学院',
primary key (`stu_id`),
constraint `fk_student_col_id` foreign key (`col_id`) references `tb_college` (`col_id`)
) engine=innodb comment '学⽣表';

-- 创建教师表
create table `tb_teacher`
(
`tea_id` int unsigned not null comment '⼯号',
`tea_name` varchar(20) not null comment '姓名',
`tea_title` varchar(10) default '助教' comment '职称',
`col_id` int unsigned not null comment '所属学院',
primary key (`tea_id`),
constraint `fk_teacher_col_id` foreign key (`col_id`) references `tb_college` (`col_id`)
) engine=innodb comment '⽼师表';

-- 创建课程表
create table `tb_course`
(
`cou_id` int unsigned not null comment '编号',
`cou_name` varchar(50) not null comment '名称',
`cou_credit` int not null comment '学分',
`tea_id` int unsigned not null comment '授课⽼师',
primary key (`cou_id`),
constraint `fk_course_tea_id` foreign key (`tea_id`) references `tb_teacher` (`tea_id`) 
) engine=innodb comment '课程表';

-- 创建选课记录表
create table `tb_record`
(
`rec_id` bigint unsigned auto_increment comment '选课记录号',
`stu_id` int unsigned not null comment '学号',
`cou_id` int unsigned not null comment '课程编号',
`sel_date` date not null comment '选课⽇期',
`score` decimal(4,1) comment '考试成绩',
primary key (`rec_id`),
constraint `fk_record_stu_id` foreign key (`stu_id`) references `tb_student` (`stu_id`),
constraint `fk_record_cou_id` foreign key (`cou_id`) references `tb_course` (`cou_id`),
constraint `uk_record_stu_cou` unique (`stu_id`, `cou_id`) 
) engine=innodb comment '选课记录表';
```

---

## 二、删除表

直接删除表，如果表不存在则报错

```mysql
-- 直接删除表
drop table `tb_student`;
```

判断表是否存在，存在则删除它，不存在也不会报错
```mysql
-- 如果`tb_school`表存在，则删除它
drop table if exists `tb_student`;
```

> <font color="red">**注意：**</font>如果要删除的表中的字段是另一个表的外键，则无法删除表。

<font color="red">**111**</font>

## 三、修改表

1. 添加一个新的列(字段)

```mysql
-- 新增一个`stu_tel`的列
alter table `tb_student` add column `stu_tel` varchar(20) comment '联系电话';
```

> <font color="red">**注意：**</font>如果新增列的时候指定了⾮空约束（ not null ），那么学⽣表不能够有数据，否则原来的数据增加了stu_tel 列之后是没有数据的，这就违反了⾮空约束的要求；当然，我们在添加列的时候也可以使⽤默认值约束来解决这个问题。

```mysql
-- 新增一个非空`stu_tel`的列，默认电话123456
alter table `tb_student` add column `stu_tel` varchar(20) not null default '123456' comment '联系电话';
```

2. 删除指定的列

```mysql
-- 删除列`stu_tel`
alter table `tb_student` drop column `stu_tel`;
```

3. 修改列的数据类型

```sql
-- 将学⽣表的 stu_sex 修改为字符
alter table `tb_student` modify column `stu_sex` char(1) not null default 'M' comment '性 别';
```

4. 修改列的命名

```sql
-- 将学⽣表的 stu_sex 修改为 stu_gender
alter table `tb_student` change column `stu_sex` `stu_gender` boolean default 1 comment '性 别';
```

5. 删除约束条件

```sql
-- 删除学⽣表的 col_id 列的外键约束
alter table `tb_student` drop foreign key `fk_student_col_id`;
```

6. 添加约束条件

```sql
-- 给学⽣表的 col_id 列加上外键约束
alter table `tb_student` add foreign key (`col_id`) references `tb_college` (`col_id`);
-- or
alter table `tb_student` add constraint `fk_student_col_id` foreign key (`col_id`) references `tb_college` (`col_id`);
```

> **说明**：在添加外键约束时，还可以通过 on update 和 on delete 来指定在被引⽤的表发⽣删除和更新操作时，应该进⾏何种处理，⼆者的默认值都是 restrict ，表示如果存在外键约束，则不允许更新和删除被引⽤的数据。除了 restrict 之外，这⾥可能的取值还有 cascade （级联操作）和 set null （设置为空），有兴趣的读者可以⾃⾏研究。

7. 修改表的名字

```sql
-- 将学⽣表的名字修改为 tb_stu_info
alter table `tb_student` rename to `tb_stu_info`;
```

> **提示**：⼀般情况下，请不要轻易修改数据库或表的名字。
