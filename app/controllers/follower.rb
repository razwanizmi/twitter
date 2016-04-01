post '/users/:user_id/followers/:id' do
  follower = Follower.new(user_id: params[:user_id], follower_id: params[:id])
  follower.save!
  redirect "/users/#{params[:user_id]}"
end

delete '/users/:user_id/followers/:id' do
  follower = Follower.find_by(user_id: params[:user_id], follower_id: params[:id])
  follower.destroy!
  redirect "/users/#{params[:user_id]}"
end