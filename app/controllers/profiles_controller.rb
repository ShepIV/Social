class ProfilesController < ApplicationController
  # before_action :set_profile
  def index
    @profile = Profile.all
  end

  def show

  end

  def edit
  end


private
  # def set_profile
  #   @profile = Profile.find(params[:id])
  # end

  def profile_params
    params.require(:profile).permit(:id, :user_id, :first_name, :last_name, :avatar, :bg, :about, :interests, :telephone)
  end
end
