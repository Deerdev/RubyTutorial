# !/usr/bin/ruby
# coding=utf-8
# 中文处理

puts "Hello World! 你好";

class Sample
   def hello
      puts "Hello Ruby!"
   end
end
 
aFile = File.new("input.txt", "r+")
if aFile
   aFile.syswrite("ABCDEF")
   aFile.rewind
   aFile.each_byte {|ch| putc ch; putc ?. }
else
   puts "Unable to open file!"
end

putc ?.