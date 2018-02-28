class Item < ApplicationRecord
  belongs_to :user
  # mount_uploader :photo, PhotoUploader
  # to do:
  # has_many :bookings
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :console, presence: true
  validates :category, presence: true
end
