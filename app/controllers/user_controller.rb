class UserController < ApplicationController

  #-----Create-----

  get '/user/sign_up' do
    erb :'users/sign_up'
  end

  post '/user/sign_up' do
    user = User.create(params[:user])
  end

  #-----Read-----

  get '/user/homepage' do
    erb :'users/homepage'
  end

end
