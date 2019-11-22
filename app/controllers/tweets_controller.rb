class TweetsController < ApplicationController
  before_action :redirect_to_index, except: [:index, :show]
  
  def index
    @tweets = Tweet.includes(:user).order('created_at DESC').page(params[:page]).per(10)
  end

  def new
  end

  def create
    Tweet.create(text: tweet_params[:text], title: tweet_params[:title], user_id: current_user.id)
    redirect_to action: :index
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params) if tweet.user_id == current_user.id
    
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
    redirect_to action: :index
  end

  def show
    @tweet = Tweet.find(params[:id])
  end
  
  private
    def tweet_params
      params.permit(:title, :text)
    end
    
    def redirect_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
