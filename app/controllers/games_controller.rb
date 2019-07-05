class GamesController < ApplicationController

  #-----Create-----
  get '/games/new' do
    erb :'games/new'
  end

  post '/games' do
    Game.create(params[:game])
  end

  #-----Read-----

  get '/games' do
    erb :"games/index"
  end

end
