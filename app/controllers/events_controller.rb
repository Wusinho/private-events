class EventsController < ApplicationController
 
  def index
    @upcoming = Event.upcoming.sort { |a, b| a.date <=> b.date }
    @past = Event.past.sort { |a, b| b.date <=> a.date }
  end

  def show
    if session[:user_id]
      @event = Event.find_by(params[:id])
      @date = date_now
      @attendance = Attendance.new
      @users_not_in = User.all.where.not(id: @event.attendee).where.not(id: Current.user.id)
    else
      redirect_to sign_in_path
    end
  end

  def create
    #@user = User.find_by(username: params[:username])
    @event = Current.user.events.build(event_params)

    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def edit; end
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    if Current.user
      @event = Event.new
    else
      redirect_to root_path
    end
  end
  def enroll
    @user = User.find_by(username: params[:username])
  end


  private
  def event_params
    params.require(:event).permit(:title, :date, :location, :body, :user_id)
  end

end
