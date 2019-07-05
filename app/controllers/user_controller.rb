class UserController < ApplicationController

  #-----Create-----

  get '/user/sign_up' do
    erb :'user/sign_up'
  end

  post '/user/sign_up' do
    user = User.create(params[:user])
  end

  #-----Read-----

  get '/user/homepage' do
    erb :'user/homepage'
  end

end
