#!/usr/bin/ruby -w
# -*- coding : utf-8 -*-
# -----------------------------------------------


# 1. initialize 方法

# initialize 方法是一个标准的 Ruby 类方法，是类的构造函数，与其他面向对象编程语言中的 constructor 工作原理类似。当您想要在创建对象的同时初始化一些类变量，initialize 方法就派上用场了。该方法带有一系列参数，与其他 Ruby 方法一样，使用该方法时，必须在前面放置 def 关键字，如下所示：

class Box
   def initialize(w,h)
      # 实例变量 @ 开头
      @width, @height = w, h
   end

   # 访问器方法
   def getWidth
      @width
   end
   def getHeight
      @height
   end
 
   # 设置器方法
   def setWidth=(value)
      @width = value
   end
   def setHeight=(value)
      @height = value
   end
end

# getter 和 setter 方法 方便外部访问实例变量

# 创建对象
box = Box.new(10, 20)
 
# 使用设置器方法
box.setWidth = 30
box.setHeight = 50
 
# 使用访问器方法
x = box.getWidth()
y = box.getHeight()
 
puts "盒子宽度 : #{x}"
puts "盒子高度 : #{y}"


# -----------------------------------------------

# 2.供外部访问变量声明
# 变量声明 attr_accessor :variable_name、attr_reader :variable_name、attr_writer :variable_name 三种属性声明方法
# 其中：accessor=reader+writer, 变量名前一定要带 : ，变量名之间要用 , 分割
class Box
   attr_accessor :width, :height
 
   # 构造器方法
   def initialize(w,h)
      @width, @height = w, h
   end
 
   # 实例方法
   def getArea
      @width * @height
   end
end


# -----------------------------------------------

# 3. 类变量 、类方法
# 类变量：@@ 开头，在类定义时初始化
# 类方法：self.xxxx 
class Box
   # 初始化类变量
   @@count = 0
   def initialize(w,h)
      # 给实例变量赋值
      @width, @height = w, h
 
      @@count += 1
   end
 
   def self.printCount()
      puts "Box count is : #@@count"
   end
end
 
# 创建两个对象
box1 = Box.new(10, 20)
box2 = Box.new(30, 100)
 
# 调用类方法来输出盒子计数
Box.printCount()


# -----------------------------------------------

# 4. to_s 方法： 打印类的字符串描述

class Box
   # 构造器方法
   def initialize(w,h)
      @width, @height = w, h
   end
   # 定义 to_s 方法
   def to_s
      "(w:#@width,h:#@height)"  # 对象的字符串格式
   end
end
 
# 创建对象
box = Box.new(10, 20)
 
# 自动调用 to_s 方法
puts "String representation of box is : #{box}"


# -----------------------------------------------

# 5. 访问控制
# 默认public，private protected 同 C++

# 定义类
class Box
   # 构造器方法
   def initialize(w,h)
      @width, @height = w, h
   end
 
   # 实例方法默认是 public 的
   def getArea
      getWidth() * getHeight
   end
 
   # 定义 private 的访问器方法
   def getWidth
      @width
   end
   def getHeight
      @height
   end
   # make them private
   private :getWidth, :getHeight
 
   # 用于输出面积的实例方法
   def printArea
      @area = getWidth() * getHeight
      puts "Big box area is : #@area"
   end
   # 让实例方法是 protected 的
   protected :printArea
end
 
# 创建对象
box = Box.new(10, 20)
 
# 调用实例方法
a = box.getArea()
puts "Area of the box is : #{a}"
 
# 尝试调用 protected 的实例方法
box.printArea()   # 调用失败

# -----------------------------------------------

# 6.继承、方法/运算符 重载

# Ruby 不支持多继承，但是 Ruby 支持 mixins
class Box
   # 构造器方法
   def initialize(w,h)
      @width, @height = w, h
   end
   # 实例方法
   def getArea
      @width * @height
   end

   # ------ 重载运算符 ------
   def +(other)         # 定义 + 来执行向量加法
    Box.new(@width + other.width, @height + other.height)
  end
 
  def -@               # 定义一元运算符 - 来对 width 和 height 求反
    Box.new(-@width, -@height)
  end
 
  def *(scalar)        # 执行标量乘法
    Box.new(@width*scalar, @height*scalar)
  end
end
 
# 定义子类
class BigBox < Box
   # 添加一个新的实例方法
   def printArea
      @area = @width * @height
      puts "Big box area is : #@area"
   end

   # ------ 方法重载 ------
   # 改变已有的 getArea 方法
   def getArea
      @area = @width * @height
      puts "Big box area is : #@area"
   end
end
 
# 创建对象
box = BigBox.new(10, 20)
 
# 输出面积
box.printArea()



# -----------------------------------------------

# 7. 冻结对象
# 把一个对象变成一个常量。
# 任何对象都可以通过调用 Object.freeze 进行冻结。冻结对象不能被修改，也就是说，您不能改变它的实例变量
# 使用 Object.frozen? 方法检查一个给定的对象是否已经被冻结

class Box
   # 构造器方法
   def initialize(w,h)
      @width, @height = w, h
   end
 
   # 访问器方法
   def getWidth
      @width
   end
   def getHeight
      @height
   end
 
   # 设置器方法
   def setWidth=(value)
      @width = value
   end
   def setHeight=(value)
      @height = value
   end
end
 
# 创建对象
box = Box.new(10, 20)
 
# 让我们冻结该对象
box.freeze
if( box.frozen? )
   puts "Box object is frozen object"
else
   puts "Box object is normal object"
end
 
# 现在尝试使用设置器方法
box.setWidth = 30    # 报错：无法修改
box.setHeight = 50   # 报错：无法修改
 

# -----------------------------------------------

# 8.类常量
# 全大写的变量，不需要 @ 或 @@ 修饰
# 类内直接当变量访问
# 类外需要使用作用域访问 A::BOX
 
class Box
   BOX_COMPANY = "TATA Inc"
   BOXWEIGHT = 10
   # 构造器方法
   def initialize(w,h)
      @width, @height = w, h
   end
   # 实例方法
   def getArea
      @width * @height
   end
end
 
# 创建对象
box = Box.new(10, 20)
 
# 调用实例方法
a = box.getArea()
puts "Area of the box is : #{a}"
puts Box::BOX_COMPANY
puts "Box weight is: #{Box::BOXWEIGHT}"




# -----------------------------------------------

# 9.使用 allocate 创建对象
# 调用 allocate 来创建一个未初始化的对象
class Box
   attr_accessor :width, :height
 
   # 构造器方法
   def initialize(w,h)
      @width, @height = w, h
   end
 
   # 实例方法
   def getArea
      @width * @height
   end
end
 
# 使用 new 创建对象
box1 = Box.new(10, 20)
 
# 使用 allocate 创建另一个对象
box2 = Box.allocate
 
# 使用 box2 调用实例方法
a = box2.getArea()
puts "Area of the box is : #{a}"    # 未初始化，无法调用

# -----------------------------------------------

# 10.类信息
# Ruby的代码逐行执行，所以在不同的上下文(context)self就有了不同的含义

class Box
   # 输出类信息
   puts "Class of self = #{self.class}"
   puts "Name of self = #{self.name}"
end

# 这意味着 类定义 可通过把该类作为当前对象来执行（代码逐行执行），同时也意味着元类和父类中的该方法在方法定义执行期间是可用的。

# -----------------------------------------------


# -----------------------------------------------





# -----------------------------------------------


# -----------------------------------------------





# -----------------------------------------------

# -----------------------------------------------


# -----------------------------------------------


# -----------------------------------------------





# -----------------------------------------------


# -----------------------------------------------





# -----------------------------------------------