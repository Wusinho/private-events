class ApplicationController < ActionController::Base
  before_action :set_current_user

  def date_now
    date = DateTime.now
    date.localtime.strftime('%m/%d/%Y %H:%M')
  end

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
