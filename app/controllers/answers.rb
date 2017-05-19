get '/questions/:question_id/answers/new' do
  halt(404, erb(:'404')) unless logged_in?
  @question = Question.find(params[:question_id])
  erb :'/answers/new'
end

post '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  answer = Answer.new(params[:answer])
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
