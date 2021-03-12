class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :attendances
  has_many :attendee, through: :attendances, source: :user


  validates :title, presence: true
  validates :location, presence: true
  validates :body, presence: true
end
