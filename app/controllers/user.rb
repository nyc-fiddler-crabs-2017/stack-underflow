get '/login' do
  erb :'users/login'
end

post '/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/questions'
  else
    @errors=["Invalid user/password combination"] #do I need to customize an error message?
    erb :'users/login'
  end
end

get '/logout' do
  session.clear
  redirect '/questions'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id]=@user.id
    redirect '/questions'
  else
    @errors=@user.errors.full_messages
    erb :'users/new'
  end
end
