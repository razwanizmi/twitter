get '/tweets/new' do
  erb :"tweet/new_tweet"  
end

post '/tweets' do
  tweet = Tweet.new(params[:tweet].merge(user_id: current_user.id))
  if tweet.save
    redirect "/users/#{current_user.id}"
  else
    @error = tweet.errors.full_messages.first
    erb :"tweet/new_tweet"
  end
end

get '/tweets/index' do
  @tweets = Tweet.all
  erb :"tweet/all_tweets"
end

get '/tweets/:id/edit' do
  @tweet = Tweet.find(params[:id])
  erb :"tweet/edit_tweet"
end

put '/tweets/:id' do
  tweet = Tweet.find(params[:id])
  tweet.update(params[:tweet].merge(user_id: current_user.id))
  redirect "/users/#{current_user.id}"
end

delete '/tweets/:id' do
  tweet = Tweet.find(params[:id])
  tweet.destroy!
  redirect "/users/#{current_user.id}"
end