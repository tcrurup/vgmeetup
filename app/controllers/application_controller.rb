class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "agdq"
    use Rack::Flash
  end

  get '/' do
    redirect '/login'
  end

  get '/login' do
    if logged_in?
      redirect "/user/#{current_user.slug}"
    else
      erb :login
    end
  end

  post '/login' do
    if login(params)
      redirect '/user/homepage'
    else
      flash[:message] = 'login unsuccessful please try again'
      redirect '/login'
    end
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
