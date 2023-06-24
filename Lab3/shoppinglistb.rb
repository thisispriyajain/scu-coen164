require 'erb'

def shopping_items
	['milk', 'egg', 'ham', 'bread']
end

def template
	File.read("shoppinglisttemplate.erb")
end

class ShoppingList
	include ERB::Util
	attr_accessor :items, :template, :date

	def initialize(items, template, date=Time.now)
		@items = items
		@template = template
		@date =date
	end

	def render
		erb_object=ERB.new(@template) #erb object has template as attribute
		erb_object.result(binding) # last evaluated value get returned
	end

	def output(file)
		File.open(file, "w") do |file|
			file.write(render) #write filter result to the output file
		end
	end
end

list = ShoppingList.new(shopping_items, template)
list.output('shoppinglist2.html')