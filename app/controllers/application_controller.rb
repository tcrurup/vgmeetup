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

  get '/login' do
    erb :login
  end

  post '/login' do
    login(params)
    erb :'users/homepage'
  end

  get '/logout' do
    logout
    redirect'/login'
  end

  helpers do

    def current_user
      @current_user ||= User.find_by(email: session[:email]) if session[:email]
    end

    def logged_in?
      !!current_user
    end

    def login(params)
      user = User.find_by(username: params[:username])
      if !!user && user.authenticate(params[:password])
        session[:email] = user.email
      end
    end

    def logout
      session.clear
    end

  end

end
