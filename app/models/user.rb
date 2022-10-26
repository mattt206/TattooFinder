class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :services, dependent: :destroy
  has_many :bookings, dependent: :destroy
  # has_one :provider
  # belongs_to :provider
  belongs_to :provider, optional: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :user_type, presence: true
  validates :nickname, presence: true, uniqueness: true
end
