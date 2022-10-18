class Provider < ApplicationRecord
  belongs_to :user
  # has_many
  # has_and_belongs_to_many :users
  has_many_attached :photos

  validates :name, :address, :start_time, :close_time, uniqueness: true
  # validates :category, uniqueness: true

end
