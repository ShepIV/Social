class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: %i[show edit update destroy likes unlikes]

  def index
    @comments = @post.comments.order(:created_at).page(params[:page]).per(3)
  end

  def show; end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @comment.save!
        format.html { redirect_to :back }
        format.json
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def likes
    current_user.like!(@comment)
    render :like_button_comments
  end

  def unlikes
    current_user.unlike!(@comment)
    render :like_button_comments
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
