class Product < ApplicationRecord
  mount_uploader :image, ProductImageUploader
  belongs_to :user
  belongs_to :category
  has_many :favorites, dependent: :destroy
  has_many :favorited_by_users, through: :favorites
  validates :title, :price, presence: true
end
