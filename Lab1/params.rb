#Write a method that can take variable length of parameters, and in this method, 
#print out information about number of parameters and value of each parameters.

def print_params(*params)
	puts "The number of parameters is #{params.length}"
	for i in (0...params.length) do
		puts "The parameters are #{params[i]}"
	end
end

print_params "Priya", "P", "3", "4", "02"
print_params "Jain", "J", "21"