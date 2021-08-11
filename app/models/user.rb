class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  has_many :listings, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :favourite_listings
  has_many :favourites, through: :favourite_listings, source: :listing

end
