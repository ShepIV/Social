class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :likes, :unlikes]

  # GET /comments
  # GET /comments.json
  def index
    @comments = @post.comments.order(:created_at).page(params[:page]).per(3)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    # @comment = Comment.new(comment_params)
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @comment.save!
        format.html { redirect_to :back }
        format.json
        format.js
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
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

  # DELETE /comments/1
  # DELETE /comments/1.json
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