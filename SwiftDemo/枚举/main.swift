//
//  main.swift
//  枚举
//
//  Created by hyq on 15/4/3.
//  Copyright (c) 2016年 hyq. All rights reserved.
//

import Foundation
/*
Swift枚举:
Swift中的枚举比OC中的枚举强大, 因为Swift中的枚举是一等类型, 它可以像类和结构体一样增加属性和方法
格式:
enum Method{
    case 枚举值
}
*/

enum Method{
//    case Add
//    case Sub
//    case Mul
//    case Div
    // 可以连在一起写
    case Add, Sub, Mul, Div
}
// 可以使用枚举类型变量或常量接收枚举值
var m: Method = .Add
// 注意: 如果变量或常量没有指定类型, 那么前面必须加上该值属于哪个枚举类型
var m1 = Method.Add


// 利用Switch匹配
// 注意: 如果case中包含了所有的值, 可以不写default. 如果case中没有包含枚举中所有的值, 必须写default
switch (Method.Add){
    case Method.Add:
        print("加法")
    case Method.Sub:
        print("减法")
    case Method.Mul:
        print("除法")
    case Method.Div:
        print("乘法")
//    default:
//        print("都不是")
}

/*
原始值:
 OC中枚举的本质就是整数,所以OC中的枚举是有原始值的,默认是从0开始
而Swift中的枚举默认是没有原始值的, 但是可以在定义时告诉系统让枚举有原始值
enum Method: 枚举值原始值类型{
    case 枚举值
}
*/

enum Method2: Int{
    // 可以连在一起写
    case Add, Sub, Mul, Div
}
// 和OC中的枚举一样, 也可以指定原始值, 后面的值默认+1
enum Method3: Int{
    case Add = 5, Sub, Mul, Div
}

// Swift中的枚举除了可以指定整形以外还可以指定其它类型, 但是如果指定其它类型, 必须给所有枚举值赋值, 因为不能自动递增
enum Method4: Double{
    // 可以连在一起写
    case Add = 5.0, Sub = 6.0, Mul = 6.1, Div = 8.0
}
// rawValue代表将枚举值转换为原始值, 注意老版本中转换为原始值的方法名叫toRaw
print(Method4.Sub.rawValue)


// 原始值转换为枚举值
enum Method5: String{
    case Add = "add", Sub = "sub", Mul = "mul", Div = "div"
}

// 通过原始值创建枚举值
/*
注意: 
1.原始值区分大小写
2.返回的是一个可选值,因为原始值对应的枚举值不一定存在
3.老版本中为fromRaw("add")
*/
let m2 = Method5(rawValue: "add")
print(m2)

//func chooseMethod(op:Method2)
    func chooseMethod(op:String)
{
    // 由于返回是可选类型, 所以有可能为nil, 最好使用可选绑定
    if let opE = Method5(rawValue: op){
        switch (opE){
        case .Add:
            print("加法")
        case .Sub:
            print("减法")
        case .Mul:
            print("除法")
        case .Div:
            print("乘法")
        }
    }
}


/*
枚举相关值:
可以让枚举值对应的原始值不是唯一的, 而是一个变量.
每一个枚举可以是在某种模式下的一些特定值
*/
enum lineSegmentDescriptor{
    case StartAndEndPattern(start:Double, end:Double)
    case StartAndLengthPattern(start: Double, length:Double)
}

var lsd = lineSegmentDescriptor.StartAndLengthPattern(start: 0.0, length: 100.0)
lsd = lineSegmentDescriptor.StartAndEndPattern(start: 0.0, end: 50.0)
// 利用switch提取枚举关联值
/*
switch lsd
{
    case .StartAndEndPattern(let s, let e):
        print("start = \(s) end = \(e)")
    case .StartAndLengthPattern(let s, let l):
        print("start = \(s) lenght = \(l)")
}
*/

// 提取关联值优化写法
switch lsd
{
        case let .StartAndEndPattern(s, e):
            print("start = \(s) end = \(e)")
        case .StartAndLengthPattern(let s, let l):
            print("start = \(s) lenght = \(l)")
}
