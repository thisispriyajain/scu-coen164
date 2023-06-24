File.write("test.txt", "1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n")

File.open("test.txt", "r") do | file |
	file.each_line.with_index do |line, index|
		puts line if !index.even?
	end
end