class Array
	def myMap
		result = []
		self.each do |i|
			result << yield(i)
		end
		result
	end
end

puts array = [1,2,3,4,5].map{|i| "#{i} - hello" }
puts array = [1,2,3,4,5].map{|i| i * 3}
#puts array = [1,2,3,4,5].map{|i| "#{i} - #{i * 3}"}