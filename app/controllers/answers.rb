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
    if request.xhr?
      erb :'/questions/_new', layout: false, locals: {question: @question}
    else
    redirect "/questions/#{@question.id}/answers/#{answer.id}"
    end
  else
    @errors = answer.errors.full_messages
    erb :'/answers/new'
  end
end

get '/questions/:question_id/answers/:answer_id' do
  @answer = Answer.find(params[:answer_id])
  erb :'/answers/show'
end
