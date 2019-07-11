class UserController < ApplicationController

  get '/user/sign_up' do
    if logged_in?
      flash[:message] = 'You need to be logged out before you can sign up'
      redirect "/user/#{current_user.slug}"
    else
      erb :'user/sign_up'
    end
  end

  post '/user/sign_up' do
    if !!User.find_by(username: params[:user][:username])
      flash_and_redirect("That username is already taken", "/user/sign_up")
    elsif !!User.find_by(username: params[:user][:email])
      flash_and_redirect("That email is already in use", "/user/sign_up")
    else
      user = User.create(params[:user])
      redirect "/user/#{user.slug}"
    end
  end

  get '/user/edit' do
    erb :'user/edit'
  end

  patch '/user' do
    current_user.update(params[:user])
    redirect "/user/#{current_user.slug}"
  end

  post '/user/add_friend/:user_id' do
    friend = Friend.find_or_create_by(user_id: params[:user_id])
    current_user.add_friend(friend.friend_account)
    redirect "/user/#{friend.slug}"
  end

  get '/user/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'user/homepage'
  end

  get '/users' do
    erb :'user/index'
  end

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
