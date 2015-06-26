require 'sinatra'
require 'sinatra/reloader' if development?

require 'imdb'
enable :sessions

get '/home' do
	erb :movie_search
end

post '/posters' do
	@random = rand(9)
	@search = Imdb::Search.new(params[:movie_search])
	@year = @search.movies[@random].year
	@title = @search.movies[@random].title
	session[:year] = @year
	session[:title] = @title
	erb :trivia
end 

post '/results' do
	@answer = params[:answer]
	@i = Imdb::Movie.new(@answer)
	@year_answer = session[:year]
	@title_answer = session[:title]

	erb :results
end