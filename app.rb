require 'sinatra/base'
require 'sinatra/reloader'

class Battle < Sinatra::Base 
    enable :sessions
    configure :development do
        register Sinatra::Reloader
    end

    get '/' do
        erb(:index)
    end

    post '/names' do
        session['player_one'] = params[:player_one]
        session['player_two'] = params[:player_two]
        redirect "/play"
    end


    get '/play' do
        @player_one = session[:player_one]
        @player_two = session[:player_two]
        erb(:play)
    end

    # start server if ruby file executed directly
    run! if app_file == $0
end

