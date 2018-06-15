class QuestionApplicationController < ApplicationController

  get '/questions' do
    if logged_in?
     erb :'/questions/show'
    else
      redirect to '/'
    end
  end

  get '/questions/new' do
    if logged_in?
      erb :'/questions/new'
    else
      redirect to '/'
    end
  end

end
