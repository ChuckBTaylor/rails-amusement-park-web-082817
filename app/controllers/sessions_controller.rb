class SessionsController < ApplicationController

  def signin
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      login(@user)
      redirect_to @user
    else
      flash.now[:error] = "Failed"
      render :signin
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

end
