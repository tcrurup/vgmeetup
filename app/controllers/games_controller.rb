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

  get '/games/:slug' do
    @game = Game.find_by_slug(params[:slug])
    erb :"games/show"
  end

end
