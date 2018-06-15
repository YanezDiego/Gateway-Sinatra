class UserApplicationController < ApplicationController

  get '/user/login' do
    if !logged_in?
      erb :'/user/login'
    else
      redirect to 'user/profile'
    end
  end

  post '/user/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.ide
      redirect to '/user/profile'
    else
      redirect to '/signup'
    end
  end

  get '/user/profile' do
    if logged_in?
      erb :'/user/profile'
    else
      refirect to '/user/login'
    end
  end

  get '/user/logout' do
    if logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/'
    end
  end



end
