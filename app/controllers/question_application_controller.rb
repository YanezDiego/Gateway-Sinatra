class QuestionApplicationController < ApplicationController

  get '/questions' do
    if logged_in?
      @questions = Question.all
     erb :'/questions/index'
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

  post '/questions' do
    if logged_in?
      @question = current_user.questions.build(content: params[:content])
      if @question.save
        redirect to "/questions/#{@question.id}"
      else
        redirect to '/questions/new'
      end
    else
      redirect to '/'
    end
  end

  get '/questions/:id' do
    if logged_in?
      @question = Question.find_by_id(params[:id])
      erb :'/questions/show'
    else
      redirect to '/'
    end
  end


end
