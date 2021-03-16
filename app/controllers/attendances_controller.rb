# rubocop:disable Layout/LineLength

class AttendancesController < ApplicationController
  def create
      Attendance.new(event_id: params[:event_id], user_id: Current.user.id).save
      
    redirect_to event_path(params[:event_id])
  end



  
end

# rubocop:enable Layout/LineLength
