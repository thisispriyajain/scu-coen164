require 'erb'

# def description
# 	[
# 		'Ruby makes your programming more productive',
# 		'It makes coding fun again',
# 		'If you are a programmer and want to learn Ruby',
# 		'This is the book to get',
# 		'This book will get you up to speed quickly and enjoyably',
# 	]
# end

class Book
	include ERB::Util
	attr_accessor :isbn, :title, :author, :description, :price

	def initialize(isbn, title, author, price)
		@isbn = isbn
		@title = title
		@author = author
		@description = []
		@price = price
	end

	def add_description(desc) 
		@description << desc
	end

	def get_binding
		binding
	end

	def get_template(file)
		File.read(file)
	end

	def render(file)
		template = get_template("booktemplate.erb")
		erb_object = ERB.new(template)
		File.write(file, erb_object.result(get_binding))	
	end
end

book = Book.new("978-1-93778-549-9", "Programming Ruby", "Dave Thomas", "$50.00")
book.add_description('Ruby makes your programming more productive')
book.add_description('It makes coding fun again')
book.add_description('If you are a programmer and want to learn Ruby')
book.add_description('This is the book to get')
book.add_description('This book will get you up to speed quickly and enjoyably')
book.render('book.html')