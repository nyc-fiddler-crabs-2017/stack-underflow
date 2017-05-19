post '/questions/:question_id/upvote' do
  @question = Question.find(params[:question_id])
  if logged_in?
  vote = @question.votes.new(value: 1, user_id: current_user.id)
  if vote.save
    redirect "/questions/#{@question.id}"
  else
    @question = Question.find(params[:question_id])
    @errors = vote.errors.full_messages
    erb :'questions/show'
  end
else
  @errors = ["Must be logged in"]
  erb :'questions/show'
end
end

post '/questions/:question_id/downvote' do
  @question = Question.find(params[:question_id])
  if logged_in?
  vote = Vote.new(value: -1, user_id: current_user.id)
  @question.votes << vote
  if vote.save
    redirect "/questions/#{@question.id}"
  else
    @question = Question.find(params[:question_id])
    @errors = vote.errors.full_messages
    erb :'questions/show'
  end
else
  @errors = ["Must be logged in"]
  erb :'questions/show'
end
end


post '/answers/:answer_id/upvote' do
  @answer = Answer.find(params[:answer_id])
  if logged_in?
    vote = Vote.new(value: 1, user_id: current_user.id)
    @answer.votes << vote
    if vote.save
      redirect "/questions/#{@answer.question.id}/answers/#{@answer.id}"
    else
      @answer = Answer.find(params[:answer_id])
      @errors = vote.errors.full_messages
      erb :'answers/show'
    end
  else
    @errors = ["Must be logged in"]
    erb :'answers/show'
  end
end


post '/answers/:answer_id/downvote' do
  @answer = Answer.find(params[:answer_id])
  if logged_in?
  vote = Vote.new(value: -1, user_id: current_user.id)
  @answer.votes << vote
  if vote.save
    redirect "/questions/#{@answer.question.id}/answers/#{@answer.id}"
  else
    @answer = Answer.find(params[:answer_id])
    @errors = vote.errors.full_messages
    erb :'answers/show'
  end
else
  @errors = ["Must be logged in"]
  erb :'answers/show'
end
end

# post '/comments/:comment_id/upvote' do
#   @comment = Comment.find(params[:comment_id])
#   vote = Vote.new(value: 1, user_id: current_user.id)
#   @comment.votes << vote
#   if vote.save
#     redirect "/questions/#{@answer.question.id}/answers/#{@answer.id}"
#   else
      # @comment = Comment.find(params[:comment_id])
#     @errors = vote.errors.full_messages
#     erb :'answers/show'
#   end
# end
#
#
# post '/comments/:comment_id/downvote' do
#   @comment = Comment.find(params[:comment_id])
#   vote = Vote.new(value: -1, user_id: current_user.id)
#   @comment.votes << vote
#   if vote.save
#     redirect "/questions/#{@answer.question.id}/answers/#{@answer.id}"
#   else
#     @comment = Comment.find(params[:comment_id])
#     @errors = vote.errors.full_messages
#     erb :'answers/show'
#   end
# end
