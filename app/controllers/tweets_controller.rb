class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tweet = Tweet.new
    if (params[:search] == nil || params[:search] == '') && (params[:tag_id] != nil && params[:tag_id] != '')
    @tweets = params[:tag_id].present? ? Tag.find(params[:tag_id]).tweets.page(params[:page]).per(3) : Tweet.all.page(params[:page]).per(3)
    elsif params[:search] == nil || params[:search] == ''
      @tweets= Tweet.all.page(params[:page]).per(3)
    elsif params[:search] != nil && params[:search] != ''
      @tweets = Tweet.where("body LIKE ? ",'%' + params[:search] + '%').page(params[:page]).per(3)
  end
    # @tags = Tweet.joins(:tags).select("tagname","body")
    # @t = Tag.joins(:tweets).select("tagname","body")
    #@tags = Tag.all
    # @tag = Tweet.find(params[:tag_ids])
  end
  def new
    @tweet = Tweet.new
  end
  def create
    tweet = Tweet.new(tweet_params)
    if tweet.save
      redirect_to posts_reizoko_path
    else
      redirect_to :action => "new"
    end
  end

  def tweet_params
    params.require(:tweet).permit(:body, { :tag_ids=> [] })
  end
  end

