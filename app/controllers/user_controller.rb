class UserController < ApplicationController

  get '/users' do
    "hello world!"
    #erb :'users/index'
  end
end
