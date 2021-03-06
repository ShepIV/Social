class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update follow unfollow load_posts]
  def index
    @users = User.all
  end

  def show; end

  def edit; end

  def new
    @user = User.new
  end

  def update
    respond_to do |format|
      if @user.update(users_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def follow
    current_user.follow!(@user) # => This assumes you have a variable current_user who is authenticated
    render :follow_button
  end

  def unfollow
    current_user.unfollow!(@user)
    render :follow_button
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(:id, :email, profile_attributes: %i[id first_name last_name avatar bd about interests telephone])
  end
end
