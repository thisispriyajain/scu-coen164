require 'sinatra'
require 'sinatra/reloader'

require './table.rb'

#Root Page
get '/' do
	@user = User.all
	erb :homepage
end

#List of users	
get '/users' do
	@users = User.all
	erb :users
end

#Form for adding user details
get '/users/new' do
	@user = User.new
	erb :new_user
end

#Individual user detail view	
get '/users/:id' do
	@user = User.get(params[:id])
	erb :show_user
end

#Form action for /user/new that creates new record in DB
post '/users' do 
	user = User.create(params[:user])
	redirect to("/users/#{user.id}")
end

not_found do
	"No Service"
end