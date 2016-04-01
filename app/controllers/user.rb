get '/users/new' do   
  erb :"user/signup"
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    redirect '/'
  else
    @error = user.errors.full_messages
    erb :"static/signup_error"
  end
end