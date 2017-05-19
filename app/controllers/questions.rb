get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/new' do
  halt(404, erb(:'404')) unless logged_in?
  erb :'/questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

post '/questions' do
  halt(404, erb(:'404')) unless logged_in?
  question = Question.new(params[:question])
  current_user.created_questions << question
  if question.save
    redirect "/questions/#{question.id}"
  else
    @errors = question.errors.full_messages
    erb :'/questions/new'
  end
end
