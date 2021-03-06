get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/new' do
  verify
  erb :'/questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

post '/questions' do
  verify
  question = Question.new(params[:question])
  current_user.created_questions << question
  if question.save
    if request.xhr?
        erb :'/questions/_question', layout: false, locals: {question: question}
    else
    redirect "/questions/#{question.id}"
    end
  else
    @errors = question.errors.full_messages
    erb :'/questions/new'
  end
end
