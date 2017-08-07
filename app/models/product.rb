class Product < ApplicationRecord
  belongs_to :category
  has_many :line_item

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :price, numericality: { greater_than: 0.0 }

  mount_uploader :photo, ProductPhotoUploader
end
