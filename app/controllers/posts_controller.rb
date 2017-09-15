class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:show, :edit, :likes, :unlikes]
  def index
    @posts = Post.all
  end

  def new
  end

  def edit
  end

  def create
    @post = current_user.posted_posts.create(post_params.merge(author_id: current_user.id, user_id: @user.id))

    respond_to do |format|
      if @post.save!
        format.html { redirect_to user_path(@user.id), notice: 'Post was successfully created.' }
      end
    end
  end

  def update
  end

  def show
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@user.id), notice: 'Post was successfully destroyed.' }
    end
  end

  def likes
    current_user.like!(@post)
    render :like_button
  end

  def unlikes
    current_user.unlike!(@post)
    render :like_button
  end
  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:id, :user_id, :author_id, :text, :image)
  end
end
