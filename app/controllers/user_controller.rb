class UserController < ApplicationController

  get '/user/login' do
    erb :'users/login'
  end

  get '/user/sign_up' do
    erb :'users/sign_up'
  end

end
