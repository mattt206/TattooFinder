class Provider < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :name, :address, :start_time, :close_time, uniqueness: true
  validates :category, uniqueness: true

end
