require 'sinatra'
require 'sinatra/reloader'
require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/bets.db")

class Bets 
	include DataMapper::Resource
	property :id, Serial
	property :user, Text
	property :password, Text
	property :accountWin, Integer
	property :accountLoss, Integer
	property :accountProfit, Integer
end

DataMapper.finalize
Bets.auto_upgrade!

configure do
	enable :sessions
	set :id, nil
	set :message, ""
	set :sessionWin, 0
	set :sessionLoss, 0
	set :sessionProfit, 0
	set :totalWin, 0
	set :totalLoss, 0
	set :totalProfit, 0
end

get '/' do
	erb :index 
end

get '/login' do
	if session[:login]
		redirect '/betting'
	else
		@message = session[:message]
		erb :login
	end
end

post '/login' do
	@user = params[:user]
	@password = params[:password]

	@bet = Bets.first(user: @user, password: @password)
	if @bet != nil
		 	session[:login] = true
		 	session[:id] = @bet[:id]
		 	session[:sessionWin] = 0
		 	session[:sessionLoss] = 0
		 	session[:sessionProfit] = 0
		 	session[:totalWin] = @bet[:accountWin] 
		 	session[:totalLoss] = @bet[:accountLoss]
		 	session[:totalProfit] = @bet[:accountProfit]
		 	session[:message] = ""
		 	redirect '/betting'
	 	else 
		 	session[:message] = "Username or Password is incorrect"
		 	redirect '/login'
	end
end

get '/signup' do
	erb :signup
end 

post '/signup' do
	bet = Bets.new(
			user: params[:user],
			password: params[:password],
			accountWin: 0,
			accountLoss: 0,
			accountProfit: 0
		)

	session[:sessionWin] = 0
	session[:sessionLoss] = 0
	session[:sessionProfit] = 0
	session[:totalWin] = 0
	session[:totalLoss] = 0
	session[:totalProfit] = 0

	bet.save
	session[:id] = bet[:id]

	redirect '/betting'

end

get '/betting' do

	@message = session[:message]

	@sessionWin = session[:sessionWin]
	@sessionLoss = session[:sessionLoss]
	@sessionProfit = session[:sessionProfit]

	@totalWin = session[:totalWin]
	@totalLoss = session[:totalLoss]
	@totalProfit = session[:totalProfit]

	erb :betting

end

post '/betting' do 
	@wager = params[:wager].to_i
	number = params[:number].to_i
	roll = rand(1..6)
	if number == roll 
		save_win(5 * @wager)
		session[:message] = "The dice landed on #{roll}. You win #{5*@wager} dollars."
	else 
		save_lost(@wager)
		session[:message] = "The dice landed on #{roll}. You lost #{@wager} dollars. You've lost a total of #{session[:sessionLoss]} dollars."
	end

	redirect '/betting'
end

get '/logout' do
	puts('Hello World')
	@bet = Bets.get(session[:id])
	puts(@bet.accountWin)
	@bet.accountWin += session[:totalWin]
	@bet.accountLoss += session[:totalLoss]
	@bet.accountProfit += session[:totalProfit]


	@bet.save

	session.clear

	redirect '/'
end

def save_win(money)
	session[:sessionWin] += money
	session[:sessionProfit] = session[:sessionWin] - session[:sessionLoss]

	session[:totalWin] += money
	session[:totalProfit] = session[:totalWin] - session[:totalLoss]
end

def save_lost(money)
	session[:sessionLoss] += money
	session[:sessionProfit] = session[:sessionWin] - session[:sessionLoss]

	session[:totalLoss] += money
	session[:totalProfit] = session[:totalWin] - session[:totalLoss]
end