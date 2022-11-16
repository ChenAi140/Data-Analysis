# 第2高的薪水

## 一、题目

### 1. 表结构
表`Employee`
```
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id 是这个表的主键。
表的每一行包含员工的工资信息。
```

### 2. 题目描述

&emsp;&emsp;编写一个 SQL 查询，获取并返回 **Employee** 表中第二高的薪水 。如果不存在第二高的薪水，查询应该返回 **null** 。



## 二、示例

### 1. 示例1
```
输入：
Employee 表：
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
输出：
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
```

### 2. 示例2

```
输入：
Employee 表：
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
输出：
+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+
```



## 三、解答SQL

### 1. 方法1
&emsp;&emsp;使用 `IFNULL` 和 `LIMIT OFFSET` 
```sql
SELECT IFNULL( (
            SELECT DISTINCT salary
            FROM Employee
            ORDER BY salary DESC
            LIMIT 1
            OFFSET 1
        ), NULL
    ) AS SecondHighestSalary;
```

### 2. 方法2
&emsp;&emsp;先排除最大的，那么现在最大的就是第二高薪水
```sql
SELECT
    MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (
        SELECT MAX(salary)
        FROM Employee
    );
```



---



# 第N高的薪水

## 一、题目

### 1. 表结构
表`Employee`
```
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
Id是该表的主键列。
该表的每一行都包含有关员工工资的信息。
```

### 2. 题目描述
&emsp;&emsp;编写一个SQL查询来报告 `Employee` 表中第 `n` 高的工资。如果没有第 `n` 个最高工资，查询应该报告为 `null` 。

查询结果格式如下所示。



## 二、示例

### 1. 示例1

```
输入: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
n = 2
输出: 
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+
```

### 2. 示例2
```
输入: 
Employee 表:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
n = 2
输出: 
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| null                   |
+------------------------+
```



## 三、解答SQL

### 1. 方法1
&emsp;&emsp;通过改编第2高薪水
```sql
CREATE FUNCTION GETNTHHIGHESTSALARY(N INT) RETURNS 
INT BEGIN 
	-- LIMIT子句不能做运算，所以提前处理N值
	SET N = N - 1;
	RETURN (
	        -- 此处不需要处理结果为空值
	        SELECT
	            DISTINCT salary
	        FROM Employee
	        ORDER BY salary DESC
	        LIMIT 1
	        OFFSET N
	    );
	END
```

