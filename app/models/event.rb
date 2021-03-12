class Event < ApplicationRecord
  belongs_to :user
  belong_to :attendance
  validates :title, presence: true
  validates :location, presence: true
  validates :body, presence: true
end
