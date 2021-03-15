class EventsController < ApplicationController
 
  def index
    @upcoming = Event.upcoming.sort { |a, b| a.date <=> b.date }
    @past = Event.past.sort { |a, b| b.date <=> a.date }
  end

  def show
    if session[:current_user]
      @event = Event.find(params[:id])
      @date = date_now
      @attendance = Attendance.new
      @users_not_in = User.all.where.not(id: @event.attendee).where.not(id: session[:current_user]['id'])
    else
      redirect_to sign_in_path
    end
  end

  def create
    @user = User.find_by(username: params[:username])
    @event = @user.events.build(event_params)

    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def new
    if Current.user
      @event = Event.new
    else
      redirect_to sign_in_path
    end
  end

  private
  def event_params
    params.require(:event).permit(:title, :date, :location, :body, :user_id)
  end

end
