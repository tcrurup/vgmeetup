class UserController < ApplicationController

  get '/user/login' do
    erb :'users/login'
  end

  post '/user/login' do
    login(params)
    erb :'users/homepage'
  end

  get '/user/sign_up' do
    erb :'users/sign_up'
  end

  post '/user/sign_up' do
    user = User.create(params[:user])
  end

  get '/user/logout' do
    logout
    redirect'/user/login'
  end

end
