class PostsController < ApplicationController

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice:"入力完了しました"
    else
      render :new
    end
  end

  private
  
  def post_params
    params.require(:post).permit(:title,:body,:video)
  end

end
