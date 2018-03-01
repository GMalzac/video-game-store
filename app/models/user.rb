class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :items

  validates :username, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  # will want to add a format checker?
  validates :email, presence: true, uniqueness: true
  # will want to add a format check?
  validates :phone_number, presence: true
  validates :address, presence: true

  mount_uploader :photo, PhotoUploader
end
