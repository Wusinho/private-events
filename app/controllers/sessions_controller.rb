class SessionsController < ApplicationController
  
  def show
    if session[:current_user]
      @user = User.find(params[:id])
      current_user(@user.id)
      @date = date_now
      @attended_events = @user.attended_events.sort { |a, b| b.date <=> a.date }
      @upcoming = @user.attended_events.upcoming
      @past = @user.attended_events.past
      @my_events = @user.events
    else
      redirect_to sign_in_path
    end
  end
  
  
  
  def new; end

  def create
    @user = User.find_by(username: params[:username])

    if user.present?
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in succesfully'
    else
      flash[:alert] = 'Invalid Username'
      render :new

    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end
end
