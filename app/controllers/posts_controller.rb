class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    if @post.save
      flash[:success] = "Post Created"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
