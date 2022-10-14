class Service < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  validates :style, presence: true
  validates :description, presence: true, length: { minimum: 8, maximum: 120 }
end
