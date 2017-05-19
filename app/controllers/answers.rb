get '/questions/:question_id/answers/new' do
  verify
  @question = Question.find(params[:question_id])
  erb :'/answers/new'
end

post '/questions/:question_id/answers' do
  verify
  @question = Question.find(params[:question_id])
  answer = Answer.new(params[:answer])
  current_user.answers << answer
  @question.answers << answer

  if answer.save
    redirect "/questions/#{@question.id}/answers/#{answer.id}"
  else
    @errors = answer.errors.full_messages
    erb :'/answers/new'
  end
end

get '/questions/:question_id/answers/:answer_id' do
  @answer = Answer.find(params[:answer_id])
  erb :'/answers/show'
end


put '/questions/:question_id/answers/:answer_id' do
  #this needs to be protected for author only
  question = Question.find(params[:question_id])
  answer = Answer.find(params[:answer_id])
  question.best_answer_id = answer.id
  question.save!
  redirect "/questions/#{question.id}"
end
