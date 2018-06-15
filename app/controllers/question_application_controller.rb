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
    #need's to show who asked question. come back to it!
    if logged_in?
      @question = Question.find_by_id(params[:id])
      erb :'/questions/show'
    else
      redirect to '/'
    end
  end

  get '/questions/:id/edit' do
    if logged_in?
      @question = Question.find_by_id(params[:id])
        if @question && @question.user == current_user
          erb :'/questions/edit'
        else
          redirect to "/questions/#{@question.id}"
        end
    else
        redirect to '/'
    end
  end

  patch '/questions/:id' do
    if logged_in?
      @question = Question.find_by_id(params[:id])
      @question.update(content: params[:content])
      redirect to "/questions/#{@question.id}"
    else
      redirect to "/"
    end
  end

  delete '/questions/:id/delete' do
    if logged_in?
      @question = current_user.questions.find_by(id: params[:id])
      if @question && @question.destroy
        redirect to '/questions'
      else
        redirect "/questions"
      end
    else
      redirect '/'
    end
  end

end
