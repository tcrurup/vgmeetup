class UserController < ApplicationController

  #-----Create-----

  get '/user/sign_up' do
    erb :'user/sign_up'
  end

  post '/user/sign_up' do
    user = User.create(params[:user])
  end

  #-----Read-----

  get '/user/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'user/homepage'
  end

  get '/users' do
    erb :'user/index'
  end

  #-----Update-----

  post '/user/add_game/:game_slug' do
    game = Game.find_by_slug(params[:game_slug])
    current_user.add_game_to_collection(game)
    redirect "/user/#{current_user.slug}"
  end

  post '/user/remove_game/:game_slug' do
    game = Game.find_by_slug(params[:game_slug])
    current_user.remove_game_from_collection(game)
    redirect "/user/#{current_user.slug}"
  end

end
