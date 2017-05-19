get '/questions/:question_id/comments/new' do
end

post '/questions/:question_id/comments' do
  verify
  @question = Question.find(params[:question_id])

  @comment = @question.comments.new(body: params[:comment][:body])
  current_user.comments << @comment
  if @comment.save
    if request.xhr?
      erb :'comments/_comment', layout: false, locals: {comment: @comment}
    else
    redirect "/questions/#{@question.id}"
    end
  else
      @errors = @comment.errors.full_messages
      erb :"/_errors", locals: {question: @question}, layout: false
  end
end
