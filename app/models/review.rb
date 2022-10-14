class Review < ApplicationRecord
  belongs_to :service
  validates :rating, presence: true
  validates :content, presence: true, length: { minimum: 8, maximum: 120 }, uniqueness:
  { scope: :service, message: 'Ya realizaste un comentario de este servicio' }
end
