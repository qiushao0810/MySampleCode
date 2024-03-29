//
//  main.swift
//  运算符
//
//  Created by hyq on 16/2/28.
//  Copyright (c) 2016年 hyq. All rights reserved.
//

import Foundation

/*
算术运算符: 除了取模, 其它和OC一样, 包括优先级
+ - * / % ++ --
*/

var result = 10 + 10
result = 10 * 10
result = 10 - 10
result = 10 / 10
print(result)

/*
注意:Swift是安全严格的编程语言, 会在编译时候检查是否溢出, 但是只会检查字面量而不会检查变量, 所以在Swift中一定要注意隐式溢出
可以检测
var num1:UInt8 = 255 + 1;
无法检测
var num1:UInt8 = 255
var num2:UInt8 = 250
var result = num1 + num2
println(result)

遇到这种问题可以利用溢出运算符解决该问题:http://www.yiibai.com/swift/overflow_operators.html

&+ &- &* &/ &%
*/


/*
取模 %
OC: 只能对整数取模
NSLog(@"%tu", 10 % 3);

Swift: 支持小数取模
*/
print(10 % 3.5)


/*
自增 自减
*/
var number = 10
number++
print(number)
number--
print(number)

/*
赋值运算
= += -= /= *= %=
*/

var num1 = 10
num1 = 20
num1 += 10
num1 -= 10
num1 /= 10
num1 *= 10
num1 %= 5
print(num1)

/*
基本用法和OC一样, 唯一要注意的是表达式的值
OC: 表达式的结合方向是从左至右, 整个表达式的值整体的值等于最后一个变量的值, 简而言之就是连续赋值

Swift: 不允许连续赋值, Swift中的整个表达式是没有值的. 主要是为了避免 if (c == 9) 这种情况误写为 if (c = 9) , c = 9是一个表达式, 表达式是没有值的, 所以在Swift中if (c = 9)不成立

var num2:Int
var num3:Int
num3 = num2 = 10
*/


/*
关系运算符, 得出的值是Bool值, 基本用法和OC一样
> < >= <= == != ?:
*/
var result1:Bool = 250 > 100
var result2 = 250 > 100 ? 250 : 100
print(result2)


/*
逻辑运算符,基本用法和OC一样, 唯一要注意的是Swift中的逻辑运算符只能操作Bool类型数据, 而OC可以操作整形(非0即真)
!  && ||
*/
var open = false
if !open
{
    print("打开")
}

var age = 20
var height = 180
var wage  = 30000
if (age > 25 && age < 40 && height > 175) || wage > 20000
{
    print("约")
}

/*
区间
闭区间: 包含区间内所有值  a...b 例如: 1...5
半闭区间: 包含头不包含尾  a..<b  例如: 1..<5
注意: 1.Swift刚出来时的写法是 a..b
     2.区间只能用于整数, 写小数会有问题
应用场景: 遍历, 数组等
*/
for i in 1...5
{
    print(i)
}

for i in 1..<5
{
    print(i)
}

