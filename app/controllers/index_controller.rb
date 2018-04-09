class IndexController < ApplicationController
  def home
    return unless current_user
    redirect_to current_user
  end
end
