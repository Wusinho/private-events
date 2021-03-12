class Attendance < ApplicationRecord
    belong_to :user
    belong_to :event
end
