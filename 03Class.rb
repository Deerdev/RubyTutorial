#!/usr/bin/ruby -w
# -*- coding : utf-8 -*-
# -----------------------------------------------


# 1. 定义类
class Customer
end


# -----------------------------------------------

# 2. 成员变量

# Ruby 提供了四种类型的变量：

# 局部变量：局部变量是在方法中定义的变量。局部变量在方法外是不可用的。在后续的章节中，您将看到有关方法的更多细节。局部变量以小写字母或 _ 开始。
# 实例变量：实例变量可以跨任何特定的实例或对象中的方法使用。这意味着，实例变量可以从对象到对象的改变。实例变量在变量名之前放置符号（@）。
# 类变量：类变量可以跨不同的对象使用。类变量属于类，且是类的一个属性。类变量在变量名之前放置符号（@@）。
# 全局变量：类变量不能跨类使用。如果您想要有一个可以跨类使用的变量，您需要定义全局变量。全局变量总是以美元符号（$）开始。

class Customer
  # 类变量 @@
   @@no_of_customers=0
end


# -----------------------------------------------

# 3. 创建对象
cust1 = Customer. new
cust2 = Customer. new

# 自定义 - 创建方法 initialize
# 当声明带参数的 new 方法时，您需要在创建类的同时声明方法 initialize。
# initialize 方法是一种特殊类型的方法，将在调用带参数的类的 new 方法时执行

class Customer
   @@no_of_customers=0
   def initialize(id, name, addr)
      @cust_id=id
      @cust_name=name
      @cust_addr=addr
   end
end

cust1=Customer.new("1", "John", "Wisdom Apartments, Ludhiya")
cust2=Customer.new("2", "Poul", "New Empire road, Khandala")


# -----------------------------------------------

# 4. 成员方法
# def 开头，
# 方法名总是以 小写字母 开头，
# 使用关键字 end 来结束一个方法。

class Sample
   def hello
      puts "Hello Ruby!"
   end
end

# 使用上面的类来创建对象
object = Sample.new
object.hello


# -----------------------------------------------

# 实例

class Customer
   @@no_of_customers=0
   def initialize(id, name, addr)
      @cust_id=id
      @cust_name=name
      @cust_addr=addr
   end
   def display_details()
      # 通过 # 加 变量，打印变量值
      # 想要在一个单行上显示实例变量的文本和值时，您需要在 puts 语句的变量名前面放置符号（#）。文本和带有符号（#）的实例变量应使用双引号标记。
      puts "Customer id #@cust_id"
      puts "Customer name #@cust_name"
      puts "Customer address #@cust_addr"
   end
   def total_no_of_customers()
      @@no_of_customers += 1
      puts "Total number of customers: #@@no_of_customers"
   end
end

