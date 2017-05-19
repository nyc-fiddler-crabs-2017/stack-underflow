get '/questions/:question_id/comments/new' do
end

post '/questions/:question_id/comments' do
  verify
  question = Question.find(params[:question_id])

  @comment = question.comments.new(body: params[:comment][:body])
  current_user.comments << @comment
  if @comment.save
    redirect "/questions/#{question.id}"
  else
    redirect "/"
      # @errors = @comment.errors.full_messages
      # erb :"/questions/#{question}"
  end
end
