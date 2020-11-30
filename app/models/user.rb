class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  has_many :venues
  has_many :bookings, dependent: :destroy
  validates :first_name, :last_name, :date_of_birth, :address, :favourite_beer, presence: true
  has_many :messages
  has_many_attached :photos
end
