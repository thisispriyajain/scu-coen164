require 'sinatra'
require 'sinatra/reloader'

configure do
	set :name, "defaultname"
	set :password, "defaultpassword"
	set :accountID, "defaultaccountID"
	set :balance, "0"
end

#Root Page
get '/' do
	erb :homepage
end

#Open Account	
get '/openAccount' do
	@title = "Open Account"
	erb :openAccount
end

post '/login' do 
	settings.name = params[:username]
	settings.password = params[:password]
	settings.accountID = params[:accountID]
	settings.balance = "0"
	redirect '/accountInfo'
end

get '/accountInfo' do
	erb :accountInfo
end
	
get '/depositForm' do
	@title = "Deposit Money"
	erb :depositForm
end

post '/deposit' do
	if (params[:username] == settings.name) && (params[:password] == settings.password) && (params[:accountID] == settings.accountID) 
		settings.balance = (params[:deposit].to_i  + settings.balance.to_i)
		redirect '/accountInfo'
	else 
		"Cannot deposit money."
		redirect '/depositForm'
	end
end

get '/withdrawForm' do
	@title = "Withdraw Money"
	erb :withdrawForm
end

post '/withdraw' do
	if (params[:username] == settings.name) && (params[:password] == settings.password) && (params[:accountID] == settings.accountID)
		settings.balance = (settings.balance.to_i - params[:withdraw].to_i)
		redirect '/accountInfo'
	else
		"Cannot withdraw money."
		redirect '/withdrawForm'
	end
end

not_found do
	"No Service"
end