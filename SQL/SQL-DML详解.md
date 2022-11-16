# DML---数据管理语言

Data Manager Language

DML主要用于向二维表中插入数据、删除数据、修改数据。

核心关键词：`insert`、`delete`、`update`

```sql
-- 切换数据库
use `school`;
```



## 一、插入数据(insert)

1. 插入完整的行

&emsp;&emsp;由于学院表的主键是⼀个⾃增字段，因此下⾯的 SQL 中⽤ default 表示该列使⽤默认值。
```sql
-- 向学院表中添加⼀个计算机学院
insert into `tb_college` values (default, '计算机学院', '学习计算机科学与技术的地⽅');
```

2. 插入行的一部分

&emsp;&emsp;指定为某些字段赋值，这样做可以不按照建表时设定的字段顺序赋值，可以按照 values 前⾯的元组中给定的字段顺序为字段赋值，但是需要注意，除了允许为 null 和有默认值的字段外，其他
的字段都必须要⼀⼀列出并在 values 后⾯的元组中为其赋值。

```sql
-- 向学院表中添加⼀个理学院
insert into `tb_college` (`col_name`, `col_intro`) values ('理学院', '学习数理的地⽅');
```

3. 插入多行

&emsp;&emsp;如果希望⼀次性插⼊多条记录，我们可以在 values 后⾯跟上多个元组来实现批量插⼊。

```sql
-- 向学院表中添加外国语学院、经济管理学院、体育学院
insert into `tb_college`
	(`col_name`, `col_intro`)
values
	('外国语学院', '学习歪果仁的语⾔的学院'),
	('经济管理学院', '经世济⺠，治理国家；管理科学，兴国之道'),
	('体育学院', '发展体育运动，增强⼈⺠体质');
```

**注意：**在插⼊数据时，要注意主键是不能重复的



## 二、删除数据(delete)

1. 删除表中指定条件的行

&emsp;&emsp;where子句用于指定条件。

```sql
-- 删除编号为 1 的学院
delete from `tb_college` where col_id=1;
```

2. 删除表中所有的记录

&emsp;&emsp;即便删除了所有的数据，delete 操作不会删除表本身。

```sql
-- 删除学院表中所有的记录
delete from `tb_college`;
```

&emsp;&emsp;使⽤`truncate table`执⾏截断表操作，truncate 的本质是删除原来的表并重新创建⼀个表。`truncate table`为DDL。



## 三、修改数据(update)

update 操作可以修改表中的数据，也可以⽤来删除指定的⾏或所有的⾏。

1. 修改单个元素

```sql
-- 将学⽣表中的“杨过”修改为“杨逍”，假设“杨过”的学号为1001
update `tb_student` set `stu_name`='杨逍' where `stu_id`=1001;
```











