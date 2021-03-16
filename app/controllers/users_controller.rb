require 'date'

class UsersController < ApplicationController

  def index
    @Users = User.all
  end

  def new
    if Current.user
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    if Current.user
      @user = User.find(params[:id])
      Current.user.id
      @attended_events = @user.attended_events.sort { |a, b| b.date <=> a.date }
      @upcoming = @user.attended_events.upcoming
      @past = @user.attended_events.past
      @my_events = @user.events
    else
      redirect_to sign_in_path
    end
  end

  def sign_in_new
    @user = User.find_by(username: params[:username])

    if @user.present?
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Logged in succesfully'
    else
      flash[:alert] = 'Invalid Username'
      render :new

    end
  end

  def sign_in
    redirect_to root_path if Current.user
  end

  def sign_out
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end

private

def user_params
  params.require(:user).permit(:username)
end


end
