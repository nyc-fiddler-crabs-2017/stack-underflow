def logged_in?
  session.has_key?(:user_id)
end

def current_user
  User.find_by_id(session[:user_id])
end

def author?(question)
  question.author_id == current_user.id if current_user
end

def verify
  halt(404, erb(:'404')) unless logged_in?
end
