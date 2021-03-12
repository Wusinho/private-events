class Attendance < ApplicationRecord
    has_many :events
    belong_to :user
end
