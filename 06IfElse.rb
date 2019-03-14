#!/usr/bin/ruby -w
# -*- coding : utf-8 -*-
# -----------------------------------------------

# 0. 定义

# if conditional [then]
#       code...
# [elsif conditional [then]
#       code...]...
# [else
#       code...]
# end

# then可以省略
x=1
if x > 2
   puts "x 大于 2"
elsif x <= 2 and x!=0
   puts "x 是 1"
else
   puts "无法得知 x 的值"
end


# 一行内 必需保留 then
if a == 4 then a = 7 end


# -----------------------------------------------


# 1. if 修饰符

$debug=1
print "debug\n" if $debug
# print: debug


# -----------------------------------------------

# 2. unless 语句

# unless conditional [then]
#    code
# [else
#    code ]
# end

# unless式和 if式作用相反，即如果 conditional 为假，则执行 code。如果 conditional 为真，则执行 else 子句中指定的 code。

x=1
unless x>2
   puts "x 小于 2"
 else
  puts "x 大于 2"
end
# print: x 小于 2


# unless 修饰符
$var =  1
print "1 -- 这一行输出\n" if $var
print "2 -- 这一行不输出\n" unless $var
 
$var = false
print "3 -- 这一行输出\n" unless $var
# print
# 1 -- 这一行输出
# 3 -- 这一行输出


# -----------------------------------------------

# 3. case 语句(类 switch-case ?)

# case expression
# [when expression [, expression ...] [then]
#    code ]...
# [else
#    code ]
# end

# case先对一个 expression 进行匹配判断，然后根据匹配结果进行分支选择。
# 它使用 === 运算符比较 when 指定的 expression，若一致的话就执行 when 部分的内容。

# 通常我们省略保留字 then 。若想在一行内写出完整的 when 式，则必须以 then 隔开条件式和程式区块
when a == 4 then a = 7 end


$age =  5
case $age
when 0 .. 2
    puts "婴儿"
when 3 .. 6
    puts "小孩"
when 7 .. 12
    puts "child"
when 13 .. 18
    puts "少年"
else
    puts "其他年龄段的"
end
# print: 小孩


# 当case的"表达式"部分被省略时，将计算第一个when条件部分为真的表达式。

foo = false
bar = true
quu = false
 
case
when foo then puts 'foo is true'
when bar then puts 'bar is true'
when quu then puts 'quu is true'
end
# print: "bar is true"


