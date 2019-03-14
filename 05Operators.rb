#!/usr/bin/ruby -w
# -*- coding : utf-8 -*-
# -----------------------------------------------


# 0. 运算符实际是方法调用

# Ruby 支持一套丰富的运算符。大多数运算符实际上是方法调用。
  # 例如，a + b 被解释为 a.+(b)，其中指向变量 a 的 + 方法被调用，b 作为方法调用的参数。


# -----------------------------------------------

# 1. 特殊比较

# <=>	联合比较运算符。
  # 如果第一个操作数等于第二个操作数则返回 0，如果第一个操作数大于第二个操作数则返回 1，如果第一个操作数小于第二个操作数则返回 -1。	
  # (a <=> b) 返回 -1。

# ===	
  # 用于测试 case 语句的 when 子句内的相等。	
  #   (1...10) === 5 返回 true。

# .eql?	
  # 如果接收器和参数具有相同的类型和相等的值，则返回 true。	
  # 1 == 1.0 返回 true，但是 1.eql?(1.0) 返回 false。

# equal?	
  # 如果接收器和参数具有相同的对象 id，则返回 true。	
  # 如果 aObj 是 bObj 的副本，那么 aObj == bObj 返回 true，a.equal?bObj 返回 false，但是 a.equal?aObj 返回 true。



# -----------------------------------------------


# 2. 并行赋值
# 使用并行赋值可以更快地声明：
a, b, c = 10, 20, 30

# 并行赋值在交换两个变量的值时也很有用：
a, b = b, c


# -----------------------------------------------

# 3. 逻辑运算符

# 文字 符号都可
# and   &&
# or    ||
# not   !

# 三元运算符
# ?:

# 范围运算符
# ..   1..10
# ...  1...10


# -----------------------------------------------

# 4. Ruby defined? 运算符

# defined? 是一个特殊的运算符，以方法调用的形式来判断传递的表达式是否已定义。
  # 它返回表达式的描述字符串，如果表达式未定义则返回 nil。

# 用法 1
defined? variable # 如果 variable 已经初始化，则为 True

foo = 42
defined? foo    # => "local-variable"
defined? $_     # => "global-variable"
defined? bar    # => nil（未定义）


# 用法 2
defined? method_call # 如果方法已经定义，则为 True

defined? puts        # => "method"
defined? puts(bar)   # => nil（在这里 bar 未定义）
defined? unpack      # => nil（在这里未定义）


# 用法 3
# 如果存在可被 super 用户调用的方法，则为 True
defined? super

defined? super     # => "super"（如果可被调用）
defined? super     # => nil（如果不可被调用）


# 用法 4
defined? yield   # 如果已传递代码块，则为 True

defined? yield    # => "yield"（如果已传递块）
defined? yield    # => nil（如果未传递块）


# -----------------------------------------------


# 5. Ruby 点运算符 "." 和双冒号运算符 "::"

# 类或模块名称和 . 来调用类或模块中的方法。
# 使用类或模块名称和两个冒号 :: 来引用类或模块中的常量。
  # :: 是一元运算符，允许在类或模块内定义常量、实例方法和类方法，可以从类或模块外的任何地方进行访问。

# ** 请记住：在 Ruby 中，类和方法也可以被当作常量。

# 你只需要在表达式的常量名前加上 :: 前缀，即可返回适当的类或模块对象。
# 如果 :: 前的表达式为类或模块名称，则返回该类或模块内对应的常量值；
# 如果 :: 前未没有前缀表达式，则返回主Object类中对应的常量值。

#e1
MR_COUNT = 0        # 定义在主 Object 类上的常量
module Foo
  MR_COUNT = 0
  ::MR_COUNT = 1    # 设置全局计数为 1
  MR_COUNT = 2      # 设置局部计数为 2
end
puts MR_COUNT       # 这是全局常量
puts Foo::MR_COUNT  # 这是 "Foo" 的局部常量

# e2
CONST = ' out there'
class Inside_one
   CONST = proc {' in there'}
   def where_is_my_CONST
      ::CONST + ' inside one'
   end
end
class Inside_two
   CONST = ' inside two'
   def where_is_my_CONST
      CONST
   end
end
puts Inside_one.new.where_is_my_CONST
puts Inside_two.new.where_is_my_CONST
puts Object::CONST + Inside_two::CONST
puts Inside_two::CONST + CONST
puts Inside_one::CONST
puts Inside_one::CONST.call + Inside_two::CONST
