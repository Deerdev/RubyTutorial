#!/usr/bin/ruby -w
# -*- coding : utf-8 -*-
# -----------------------------------------------


# 1. Ruby 程序中的空白

# 在 Ruby 代码中的空白字符，如空格和制表符一般会被忽略，除非当它们出现在字符串中时才不会被忽略。然而，有时候它们用于解释模棱两可的语句。当启用 -w 选项时，这种解释会产生警告。

# 实例：
# a + b 被解释为 a+b （这是一个局部变量）
# a  +b 被解释为 a(+b) （这是一个方法调用）


# -----------------------------------------------


# 2. Ruby 程序中的行尾

# Ruby 把分号和换行符解释为语句的结尾。
# 但是，如果 Ruby 在行尾遇到运算符，比如 +、- 或反斜杠，它们表示一个语句的延续。


# -----------------------------------------------


# 3. 多行字符串

# "Here Document" 是指建立多行字符串。在 << 之后，指定一个 字符串或标识符 来终止字符串，且当前行之后直到终止符为止的所有行是字符串的值
print <<EOF
    这是第一种方式创建here document 。
    多行字符串。
EOF
 
print <<"EOF";                # 与上面相同
    这是第二种方式创建here document 。
    多行字符串。
EOF
 
print <<`EOC`                 # 执行命令
    echo hi there
    echo lo there
EOC
 
print <<"foo", <<"bar"          # 您可以把它们进行堆叠
    I said foo.
foo
    I said bar.
bar

# 运行结果：
# 这是第一种方式创建here document 。
# 多行字符串。
# 这是第二种方式创建here document 。
# 多行字符串。
# hi there
# lo there
# I said foo.
# I said bar.


# -----------------------------------------------


# 4. Ruby BEGIN 语句

# 语法：声明 code 会在程序运行之前被调用。
# BEGIN {
#    code
# }
puts "这是主 Ruby 程序"
BEGIN {
   puts "初始化 Ruby 程序"
}

# 输出：
# 初始化 Ruby 程序
# 这是主 Ruby 程序

# -----------------------------------------------

# 5. Ruby END 语句

# 声明 code 会在程序的结尾被调用。

puts "这是主 Ruby 程序"
END {
   puts "停止 Ruby 程序"
}
BEGIN {
   puts "初始化 Ruby 程序"
}

# 输出：
# 初始化 Ruby 程序
# 这是主 Ruby 程序
# 停止 Ruby 程序


# -----------------------------------------------

# 6. 多行注释

=begin
这是注释。
这也是注释。
这也是注释。
这还是注释。
=end


# -----------------------------------------------



