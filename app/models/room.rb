class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings, dependent: :destroy
  validates :capacity, presence: true
  validates :capacity, numericality: { only_integer: true }
  validates :price_per_night, presence: true
  validates :price_per_night, numericality: { greater_than: 0 }
  # has_one_attached :photo
end
