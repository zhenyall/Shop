class Product < ApplicationRecord
  validates :title, :price, :description, presence: true
  belongs_to :category
end
