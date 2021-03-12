class User < ApplicationRecord
  has_many :events, foreign_key: :user_id, class_name: "Event"
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event


  validates :username, presence: true, uniqueness: true

end
