class StaticController < ApplicationController

  def home
    if logged_in?
      redirect_to user_path(session[:user_id])
    else
      render :home
    end
  end


end
