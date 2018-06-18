class CommentApplicationController < ApplicationController
  post '/comments/:id/new' do
    if logged_in?
      @question = Question.find_by(id: params[:id])
      @user = current_user.comments.build(content: params[:content])
      @question.comments << @user
      redirect to "/questions/#{@question.id}"
    else
      redirect to '/'
    end
  end

  get '/comments/:id' do
    if logged_in?
      @comments = Comment.find_by_id(params[:id])
      erb :'/comment/show'
    else
      redirect to '/'
    end
  end


  get '/comments/:id/edit' do
    if logged_in?
      @comment = Comment.find_by_id(params[:id])
        if @comment.user == current_user
          erb :'/comment/edit'
        else
          redirect "/comments/#{@comment.id}"
        end
    else
      redirect to '/'
    end
  end

  patch '/comments/:id' do
    if logged_in?
      @comments = Comment.find_by_id(params[:id])
      @comments.update(content: params[:content])
      redirect to "/questions/#{@comments.question.id}"
    else
      redirect to "/"
    end
  end



  delete '/comments/:id/delete' do
    if logged_in?
      @comment = current_user.comments.find_by(id: params[:id])
      if @comment && @comment.destroy
        redirect to "/questions/#{@comment.question.id}"
      end
    else
      redirect '/'
    end
  end

end
