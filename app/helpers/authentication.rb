def logged_in?
  session.has_key?(:user_id)
end

def current_user
  User.find(session[:user_id])
end

def author?(question)
  question.author_id == current_user.id
end
