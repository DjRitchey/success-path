class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @user = current_user
    @post = Post.new

  end

  def create
    @post = Post.new(post_params)
    if @post.save
      current_user.posts << @post
      redirect_to posts_path
    else
      render new_post_path
    end
  end

  def edit
    @user = current_user
    @post = Post.find_by(id: params[:id])

  end

  def update
    @user = current_user
    @post = Post.find_by(id: params[:id])

    if @post.update(post_params)
      redirect_to posts_path
    else
      render edit_post_path(@post)
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end


private

  def set_post
    @post =Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :subtitle, :content, :category_ids)
  end

end
