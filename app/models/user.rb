class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  has_many :venues
  has_many :bookings, dependent: :destroy
  validates :first_name, :last_name, :date_of_birth, :address, presence: true
  has_many :messages
  has_one_attached :photo
  after_commit :set_default_avatar, on: :create

  private
  def set_default_avatar
    self.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "avatar-1.png")), filename: 'default.png' , content_type: "image/png")
  end
end
