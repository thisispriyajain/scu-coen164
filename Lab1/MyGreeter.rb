#Write a class called MyGreeter.
#This class can initialize a name list, it will have a say_hello method, this method will print “hello” to every name in the name list
#it will also have a say_bye method, this method will print “bye” to every name in the name list

class MyGreeter
	def initialize(names)
		@names = names
	end

	def say_hello
		@names.each do |name|
			puts "hello #{name}"
		end
	end

	def say_bye
		@names.each do |name|
			puts "bye #{name}"
		end
	end
end

obj = MyGreeter.new(["john", "ken", "ivy", "amy", "wen"])
obj.say_hello
obj.say_bye