def mysterious_total(subtotal, tax, discount)
	subtotal + tax - discount
end

puts mysterious_total(100, 10, 5)

#To make it more clear, change the above code so that “keyword parameters” are used.
#also provide the default values for each parameters
def mysterious_total(subtotal: 50, tax: 15, discount: 20) 
	subtotal + tax - discount
end

#mysterious_total(subtotal: 100, tax: 10, discount: 5)

#Another advantage of keyword parameters, is you can switch order of the parameter without affecting behavior of the method.
#Try to switch order of the method call and see the result.
puts mysterious_total(tax: 10, discount: 5, subtotal: 100)

puts mysterious_total()

#use double splat ** in method definition. 
#a ** argument will be a hash that contain any uncollected keyword parameters passed to the method
def mysterious_total(**options)
	puts options
	options[:subtotal] + options[:tax] - options[:discount]
end

puts mysterious_total(subtotal: 50, tax: 15, discount: 20)