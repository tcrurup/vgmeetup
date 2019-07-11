class GamesController < ApplicationController

  #-----Create-----

  get '/games/new' do
    ensure_logged_in
    erb :'games/new'
  end

  post '/games' do
    game = Game.create(params[:game])
    if !params[:genre][:name].empty?
      new_genre = Genre.create(params[:genre])
      game.genres << new_genre
    end
    redirect "games/#{game.slug}"
  end

  #-----Read-----

  get '/games' do
    ensure_logged_in
    erb :"games/index"
  end

  get '/games/:slug' do
    ensure_logged_in
    @game = Game.find_by_slug(params[:slug])
    erb :"games/show"
  end

  #-----Update-----

  get '/games/:slug/edit' do
    ensure_logged_in
    @game = Game.find_by_slug(params[:slug])
    erb :"games/edit"
  end

  patch '/games/:slug' do
    game = Game.find_by_slug(params[:slug])
    game.update(params[:game])
    if !params[:genre][:name].empty?
      new_genre = Genre.create(params[:genre])
      game.genres << new_genre
    end
    redirect "/games/#{game.slug}"
  end

  #-----Delete-----

  get '/games/:slug/delete' do
    ensure_logged_in
    @game = Game.find_by_slug(params[:slug])
    erb :"games/delete"
  end

  delete '/games/:slug' do
    game = Game.find_by_slug(params[:slug])
    game.destroy
    redirect '/games'
  end

end
