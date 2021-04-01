class PostsController < ApplicationController
  def index
    if params[:search] == nil
      @posts= Post.all.order(id: "DESC")
    elsif params[:search] == ''
      @posts= Post.all.order(id: "DESC")
    elsif params[:search] == 'newpost'
      @posts= Post.all.order(id: "DESC")
    elsif params[:search] == 'shuffle'
      @posts= Post.all.shuffle
    elsif params[:search] == 'oldpost'
      @posts= Post.all
    else
      #部分検索
      @posts = Post.where("body LIKE ? ",'%' + params[:search] + '%')
    end
  end
  def reizoko
    @reizoko = Post.all.sample(1)
    @recipe = Tweet.all.pluck(:body)
  end
  def new
    @post = Post.new
  end
  def create
    post = Post.new(post_params)
    if post.save
      redirect_to :action => "reizoko"
    else
      redirect_to :action => "new"
    end
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end
end
