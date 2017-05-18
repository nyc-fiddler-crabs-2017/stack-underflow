get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/new' do

end

get '/questions/:id' do

end

post '/questions' do

end
