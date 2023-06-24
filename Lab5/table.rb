require 'dm-core'
require 'dm-migrations'

configure :development do
	DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/database.sqlite")
end

configure :production do
	DataMapper.auto_migrate!
end

class User
	include DataMapper::Resource
	property :id, Serial #autoincrement primary key
	property :firstname, String
	property :lastname, String
	property :birthday, Date
	property :age, Integer
end

DataMapper.finalize