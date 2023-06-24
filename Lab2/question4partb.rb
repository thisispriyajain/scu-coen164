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
	extend Greetings
end

puts "Question 4: Part B"
puts
Hello.english
Hello.french
Hello.spanish