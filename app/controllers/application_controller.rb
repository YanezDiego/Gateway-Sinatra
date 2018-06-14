require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
      set :session_secret, 'secret_gateway'
  end

  get "/" do
    erb :index
  end

  get '/signup' do
    if !logged_in?
      erb :'/user/signup'
    else
      redirect to '/users/profile'
    end
  end

  post '/signup' do
    user = User.new(username: params[:username], email: params[:email], password: params[:password])
      if user.save
        session[:user_id] = user.id
        redirect to '/user/profile'
      else
        redirect to '/signup'
      end
  end


  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by_id(id: session[:user_id]) if session[:user_id]
    end
  end

end
