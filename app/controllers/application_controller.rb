class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "agdq"

  end

  get '/' do
    "Hello World!"
  end

  helpers do

    def login(params)
      user = User.find_by(username: params[:username])
      if !!user && user.authenticate(params[:password]){
        session[:email] = user.email
      }
    end
  end

end
