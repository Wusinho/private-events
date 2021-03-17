class AttendancesController < ApplicationController
  def index
    @attendances = Attendance.all
  end

  def show
    @attendances = Attendance.find(:id)
  end

  def new
    @attendances = Attendance.new(attendances_params)
  end

  def edit; end

  def create
    @attendances = Attendance.new(user_id: set_current_user.id, event_id: params[:event_id])

    if Attendance.find_by(event_id: params[:event_id]).nil?
      redirect_to event_path(params[:event_id]) if @attendances.save
    elsif set_current_user.id == Attendance.find_by(event_id: params[:event_id]).user_id
      redirect_to event_path(params[:event_id])
      flash.alert = 'You are currently in this event'

    elsif @attendances.save
      redirect_to event_path(params[:event_id])

    end
  end

  def update
    respond_to do |format|
      if @attendances.update(attendances_params)
        format.html { redirect_to @attendances, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendances }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attendances.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attendances.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_event
    @attendances = Attendances.find(params[:id])
  end

  def attendances_params
    params.require(:attendances).permit(:user_id, :event_id)
  end
end
