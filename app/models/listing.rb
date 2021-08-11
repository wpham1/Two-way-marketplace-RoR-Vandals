class Listing < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  has_many :favourite_listings
  has_many :favourited_by, through: :favourite_listings, source: :user

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :size, presence: true
  validates :finish, presence: true
  validates :picture, presence: true

end
