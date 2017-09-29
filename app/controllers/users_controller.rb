class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :password, :height, :happiness, :nausea, :tickets, :admin))
    if @user.save
      login(@user)
      redirect_to user_path(@user)
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  def show
    redirect_to '/' if !logged_in?
  end

  def edit
  end

  def update
    @user.update(user_params(:name, :password, :height, :happiness, :nausea, :tickets, :admin )) ? (redirect_to user_path(@user)) : (render :edit)
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def ride
    @attraction = Attraction.find(params[:id])
    ride = Ride.new(user_id: session[:user_id], attraction: @attraction)
    response = ride.take_ride
    flash[:buttcheeks] = response
    redirect_to user_path(session[:user_id])
  end


  private


  def set_user
    @user = User.find(params[:id])
  end

  def user_params(*args)
    params.require(:user).permit(args)
  end

end
