get '/' do
  if logged_in?
    followings = Follower.where(follower_id: current_user.id).all.reverse
    @tweets = []
    followings.each do |following|
      following.user.tweets.all.each do |tweet|
        @tweets << tweet
      end
    end
  else
    @tweets = Tweet.all.reverse
  end
  erb :"static/index"
end