#!/usr/bin/ruby -w
# -*- coding : utf-8 -*-
# -----------------------------------------------

# 0. Ruby 支持五种类型的变量。

# 一般小写字母、下划线开头：变量（Variable）。
test

# $开头：全局变量（Global variable）。
$global

# @开头：实例变量（Instance variable）。
@member_variable

# @@开头：类变量（Class variable）类变量被共享在整个继承链中
@@class_variable

# 大写字母开头：常数（Constant）。
Test


$global_variable = 10
class Class1
  def print_global
      puts "全局变量在 Class1 中输出为 #$global_variable" # 10
  end
end
class Class2
  def print_global
      puts "全局变量在 Class2 中输出为 #$global_variable" # 10
  end
end


# -----------------------------------------------

# 1. 基本变量

# 实例变量以 @ 开头。未初始化的实例变量的值为 nil，在使用 -w 选项后，会产生警告。
# 类变量以 @@ 开头，且必须初始化后才能在方法定义中使用。引用一个未初始化的类变量会产生错误
# 局部变量以小写字母或下划线 _ 开头; 当调用一个未初始化的局部变量时，它被解释为调用一个 [不带参数的方法]
  # 对未初始化的局部变量赋值也可以当作是变量声明。变量会一直存在，直到当前域结束为止
# 常量以大写字母开头。
  # 定义在类或模块内的常量可以从类或模块的内部访问，定义在类或模块外的常量可以被全局访问。
  # 常量不能定义在方法内。引用一个未初始化的常量会产生错误。对已经初始化的常量赋值会产生警告。

class Example
   VAR1 = 100
   VAR2 = 200
   def show
       puts "第一个常量的值为 #{VAR1}"
       puts "第二个常量的值为 #{VAR2}"
   end
end
 
# 创建对象
object=Example.new()
object.show


# -----------------------------------------------

# 2. 伪变量

# 特殊的变量，有着局部变量的外观，但行为却像常量。您不能给这些变量赋任何值。

# self:     当前方法的接收器对象。
# true:     代表 true 的值。
# false:    代表 false 的值。
# nil:      代表 undefined 的值。
# __FILE__: 当前源文件的名称。
# __LINE__: 当前行在源文件中的编号。

