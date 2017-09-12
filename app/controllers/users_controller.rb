class UsersController < ApplicationController
  before_action :set_user, only: [:index, :show, :edit, :update]
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

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

  def set_user
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(:id, :email, {profile_attributes: [:id, :first_name, :last_name, :avatar, :bd, :about, :interests, :telephone]})
  end

end
