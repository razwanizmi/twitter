get '/sessions/new' do
  erb :"session/login"
end

post '/sessions' do
  user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    @message = "Error loggin in. Please ensure username and password are correct."
    erb :"session/login"
  end
end

post '/sessions/:id' do
  if logged_in?
    session[:user_id] = nil
    redirect '/'
  end
end