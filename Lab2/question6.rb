string = "abc12def34ghi56jkl78mn98op76qrs"

#replace all number with “-“
puts string.gsub!(/[\d]/, "-")
puts

#output each number
string = "abc12def34ghi56jkl78mn98op76qrs"
puts string.scan(/\d+/)
puts

#print the first number
string = "abc12def34ghi56jkl78mn98op76qrs"
puts string.scan(/\d+/).first
puts

#replace all non digit char with “-“
string = "abc12def34ghi56jkl78mn98op76qrs"
puts string.gsub!(/\D/, "-")