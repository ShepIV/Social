class UsersController < ApplicationController
  # before_action :set_user
  def index
    @users = User.all
  end


end
