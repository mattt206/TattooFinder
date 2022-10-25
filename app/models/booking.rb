class Booking < ApplicationRecord
  # belongs_to :service, optional: true
  belongs_to :user
  validates :start_time, :end_time, presence: true
end
