get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/questions'
  else
    @errors=["Invalid user/password combination"] #do I need to customize an error message?
    erb :login
  end
end

get '/logout' do
  session.clear
  redirect '/questions'
end

get '/users/new' do
  erb :register
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id]=@user.id
    redirect '/questions'
  else
    @errors=@user.errors.full_messages
    erb :register
  end
end
