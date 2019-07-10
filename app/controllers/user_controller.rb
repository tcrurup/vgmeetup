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

  #-----Update-----

  post '/user/add_game/:game_slug' do
    game = Game.find_by_slug(params[:game_slug])
    current_user.add_game_to_collection(game)
    redirect "/games/#{game.slug}"
  end

end
