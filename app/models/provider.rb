class Provider < ApplicationRecord
  extend ArrayEnum
  array_enum categories: { "Blackwork" => 1, "Tradicional" => 2, "Neotradicional" => 3, "New school" => 4,
    "Acuarela" => 5, "Japonés Tradicional" => 6, "Neo Japonés" => 7, "Realista" => 8, "Retrato" => 9,
    "Tribal" => 10, "Biomecánico" => 11, "Minimalista" => 12, "Lettering " => 13, "Trash polka " => 14,
    "Geométrico " => 15, "Dotwork" => 16, "Black & Grey " => 17, "Ignorant" => 18, "Sketch" => 19 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # array_enum tatuadores: {}
  # array_enum categories: { Blackwork: 1, Tradicional: "traidtional" }

  # belongs_to :user
  has_many :users
  has_many_attached :photos

  validates :name, :address, uniqueness: true
  # validates :category, uniqueness: true
  validates :description, presence: true, length: { minimum: 10, maximum: 120 }
end
