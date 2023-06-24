class Parent
	def initialize(name="nobody")
		@name = name
	end
end

class Child < Parent
	attr_accessor :name, :grade

	def initialize(name, grade)
		super(name)
		@grade = grade
	end
end

y = Child.new("yuan", 100)

print "name is: ", y.name
puts
puts y.grade
y.grade = 90

puts y.grade