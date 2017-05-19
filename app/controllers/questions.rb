get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/new' do
  erb :'/questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

post '/questions' do
  question = Question.new(params[:question])
  if question.save
    if request.xhr?
        erb :'/questions/_new', layout: false
    else
    redirect "/questions/#{question.id}"
    end
  else
    @errors = question.errors.full_messages
    erb :'/questions/new'
  end
end
