module Greetings
	def english
		puts "Hello!"
	end

	def french
		puts "Bonjour!"
	end

	def spanish
		puts "Hola!"
	end
end

class Hello
	include Greetings
end

puts "Question 4: Part A"
puts
hello = Hello.new
hello.english
hello.french
hello.spanish