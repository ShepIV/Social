class ProfilesController < ApplicationController
  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(users_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
