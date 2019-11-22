class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    tweet = Tweet.where(user_id: current_user.id)
    @tweets = current_user.tweets.order('created_at DESC').page(params[:page]).per(10)
  end
end
