# 【Python学习】Day-003 运算符、分支结构

[TOC]

## 1 数学运算符

加(+)、减(-)、乘(*)、除(/)、整除(//)、取余(%)、幂运算(**)

1. python中的+、-、*、/和数学中的+、-、×、÷功能一样
```python
print(5 + 2)
print(5 + 2.0)
print(5 - 2)
print(5 * 2)
print(5 / 2)

# 运行结果
'''
7
7.0
3
10
2.5
'''
```

**注意**：/ 的结果一定是浮点数，其它运算符的运算结果的类型和运算对象有关

2. 整除(//)

x // y : 求x除以y的商，商向小取值(找和小数相邻的两个整数中较小的那个)
```python
print(5 // 2)
print(-5 // 2)

# 运行结果
'''
2
-3
'''
```
应用1：希望能整除的情况下。商是整型
```python
print(4 / 2)
print(int(4 / 2))
print(4 // 2)

# 运行结果
'''
2.0
2
2
'''
```

应用2：去掉一个整数的低位数、保留高位数
```python
num = 2342
print(num // 10)
print(num // 100)

# 运行结果
'''
234
23
'''
```

3. 取余、取模(%)

x % y : 求x除以y的余数

```python
print(5 % 2)
print(15 % 4)

# 运行结果
'''
1
3
'''
```

应用1：判断两个数字之间的整除关系(余数是否为0)

```python
print(71 % 2)
print(100 % 5)

# 运行结果
'''
1
0
'''
```

应用2：去掉高位数、保留低位数
```python
num = 27283
print(num % 10)
print(num % 100)

# 运行结果
'''
3
83
'''
```

练习：获取任意一个正整数的十位数
```python
num = 8271
result = num % 100 // 10
# result = num // 10 % 10
print(result)

# 运行结果
'''
7
'''
```

4. 幂运算(**)

x ** y : 求x的y次方
```python
print(2 ** 3)
print(5 ** 4)
print(16 ** 0.5)
print(2 ** -3)

# 运行结果
'''
8
625
4.0
0.125
'''
```


## 2. 比较运算符

大于(>)、小于(<)、大于等于(>=)、小于等于(<=>)、等于(==)、不等于(!=)

**注意1**：所有的比较运算符的运算结果都是布尔值
```python
print(10 > 30)
print(10 > 30)
print(10 == 30)
print(10 == 10)
print(10 >= 10)
print(10 <= 10)
print(10 != 10)

age = 23
print('是否成年', age >= 18)

# 运行结果
'''
False
False
False
True
True
True
False
是否成年 True
'''
```

**注意2**：Python的比较运算符直接连写表示范围


## 3. 逻辑运算符

and(逻辑与运算)、or(逻辑或运算)、not(逻辑非运算)

- 单一条件：如果下雨；如果温度高于35度
- 复合条件：并且、或者

### 3.1 and - 逻辑与运算

应用场景：如果需要多个条件同时满足，就用and连接。相当于生活中的"并且"
运算规则：条件1 and 条件2
如果两个条件都成立结果是True，只要有一个不成立结果就是False


**练习1**：写判断num是否是大于10的偶数
```python
num = 100
print('num是否是大于10的偶数', num > 10 and num % 2 == 0)

# 运行结果
'''
num是否是大于10的偶数 True
'''
```

**练习2**：写条件判断num是否能同时被3和7整除
```python
num = 84
print('num是否能同时被3和7整除:', num % 3 == 0 and num % 7 == 0)

# 运行结果
'''
num是否能同时被3和7整除: True
'''
```

### 3.2  or - 逻辑或运算

- 应用场景:如果要求多个条件中有一个条件成立就行，就用or连接;相当于生活中的或者
- 运算规则:条件1 or条件2-如果两个条件都不成立结果就是False， 只要有一一个条件成立结果就是True

**练习1**
```python
num = 23
print('num是否能被3或者5整除:', num % 3 == 0 or num % 5 == 0)

# 运行结果
'''
num是否能被3或者5整除: False
'''
```

**练习2**
```python
year = 2000
print('year是否是闰年:', (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0))

# 运行结果
'''
year是否是闰年: True
'''
```

### 3.3 not - 逻辑非运算

- 应用场景：对指定条件进行否定(如果一个条件正向写条件很多，反向写条件很少，就可以用not 反向条件)
- 运算规则：not 条件


**练习**：判断num是否不能同时被3和7整除
```python
num = 23 
print('num是否不能同时被3和7整除:', not num % 21 == 0)

# 运行结果
'''
num是否不能同时被3和7整除: True
'''
```

## 4. 赋值运算符

=、+=、-=、*=、/=、**=
**注意**：所有的赋值运算符都是用来给变量赋值的，赋值运算没有结果

### 4.1 =赋值运算符

变量 = 数据
将数据保存到变量中，变量既可以是已经定义过的变量，也可以是没有定义过的变量

### 4.2 复合赋值运算符

+=、-=、*=、/=、**=
变量 += 数据
先将变量中的数据取出来，然后和后面的数据进行加法运算，最后将计算结果再赋值给变量。
变量必须是已经定义过的变量，并且里面保存的数据，可以和后面的数据进行加法运算

```python
a = 20
a += 10         # a = a + 10  -> a = 20 + 10  -> a = 30
print(a)        # 30

a -= 5          # a = a - 5  -> a = 30 - 5  = 25
a *= 2          # a *= 2  -> 25 * 2  -> a = 50
a %= 3          # a = a % 3  -> a = 50 % 3 = 2

print(a)

print(10 + 20)
print(10 > 20)

age = 19
print(age >= 18 and age <= 28)

# 所有的赋值数据都是没有结果，无法提供数据
# print(a = 10)
# print(age += 20)
# a = (b = 1)
```

##  5. 运算符优先级

1. 数学运算符 > 比较运算符 > 逻辑运算符 > 赋值运算符(最低的)
2. 数学运算符(幂运算 > 乘、除、取余、整除 > 加减)
3. 有括号先算(小括号)



