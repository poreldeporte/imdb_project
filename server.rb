require 'sinatra'
require 'sinatra/reloader' if development?

require 'imdb'

# i = Imdb::Movie.new("0095016")

# p i.title
# #=> "Die Hard"

# p i.cast_members.first
# #=> "Bruce Willis"

get '/home' do
	erb :movie_search
end

post '/posters' do
	@search = Imdb::Search.new(params[:movie_search])

	erb :trivia
end 