post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @error = user.errors.full_messages
    erb :"static/signup_error"
  end
end

get '/users/index' do
  @users = User.all
  erb :"user/everyone"
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :"user/profile"
end

get '/users/:id/edit' do
  erb :"user/edit_profile"
end

put '/users/:id' do
  user = User.find(params[:id])
  user.update(params[:user])
  redirect "/users/#{params[:id]}"
end
