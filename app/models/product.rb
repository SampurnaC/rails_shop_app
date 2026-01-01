class Product < ApplicationRecord
  mount_uploader :image, ProductImageUploader
  belongs_to :user
  belongs_to :category

  validates :title, :price, presence: true
end
