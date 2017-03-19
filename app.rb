require "sinatra"
require "sinatra/reloader" if development?
enable :sessions
require_relative "hangman"



get "/" do 
	generate_word
	session[:count] = @count
	session[:word] = @word
	session[:word_display_array] = @word_display_array

	erb :app_view
end

get "/new" do 
	generate_word
	session[:win] = false
	session[:count] = @count
	session[:word] = @word
	session[:word_display_array] = @word_display_array
	erb :app_view
end

get "/guess" do 
	@input = params[:input]
	@word = session[:word]
	@word_display_array = session[:word_display_array]
	in_game
	@count = session[:count]
	erb :app_view
end